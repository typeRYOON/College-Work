/* main.go */
/* ---------------------------------------------------------------------------------------
 >> Assignment details and provided code are created and owned by Jon Solworth.
 >> University of Illinois Chicago - CS 341, Fall 2023
 >> --------------------------------------------------------------------------------------
 >> File   : main.go :: HW-4
 >> Course : CS 341 (42735), FA23
 >> Author : Ryan Magdaleno, rmagd2
 >> System : Go 1.21 w/ Windows 10
 >> UIN    : 668523658
 - -                            - -
 >> HW-4 overview:
 >> This assignment is a simple program manager without encryption. The password manager
 >> allows adding to the vault, removing a site's users, or a specific user, and listing
 >> the contents. For more information on each function's implementation please check
 >> out their respective docstrings.
--------------------------------------------------------------------------------------- */
// Preprocessors directives:
package main
import (
    "bufio"
    "fmt"
    "os"
    "strings"
)


// PM struct of type: {string : {string : string}}
// Map keys/values  : {site : {user : password}}
type PM struct { passwordMap map[string] map[string] string }


/** func :: pmCreate:                                                                  - -
This function uses the PM struct type to generate the data structure to be used in
other functions, the functions are called via PM dot notation like pm.pmList().
    - -                                                                                - -
    @return PM: A PM struct object that holds the password manager data.
    - -                                                                                 */
func pmCreate() *PM {
    return &PM { passwordMap: make(map[string] map[string] string), }
}


/** PM func :: pmList:                                                                 - -
Iterate through password map and print contents in a formatted manner:                  
    - -                                                                                 */
func (pm *PM) pmList() {
    fmt.Printf("%-20s%-20s%-20s\n", "Site", "User", "Password")
    for site, usersMap := range pm.passwordMap {
        for user, pass := range usersMap {
            fmt.Printf("%-20s%-20s%-20s\n", site, user, pass)
        }
    }
}


/** PM func :: pmAdd:                                                                  - -
This PM function attempts to add a user-pass pair to a site map, if it exists, else
create the site map, same goes for the user map. Returns an error if the user already
exists for the site.
    - -                                                                                - -
    @param site  : A passed string to add representing the site.
    @param user  : A passed string to add representing the user.
    @param pass  : A passed string to add representing the password.
    @return error: Possible error message, nil indicates a good run.
    - -                                                                                 */
func (pm *PM) pmAdd(site, user, pass string) error {
    // Site map exists within pm, attempt to add user-pass:
    if _, within := pm.passwordMap[site]; within {
        // Adding a site user pair that already exists:
        if _, within := pm.passwordMap[site][user]; within {
            return fmt.Errorf("Duplicate entry.")
        }
        pm.passwordMap[site][user] = pass
    } else {
        // Site map doesn't exist within pm, therefore create:
        pm.passwordMap[site] = map[string] string{user: pass}
    }
    return nil
}

/** PM func :: pmRemoveSite:                                                           - -
When called the passed string will be removed from the password manager, the site can
contain one or many values.
    - -                                                                                - -
    @param site  : A passed string to remove representing the site.
    @return error: Possible error message, nil indicates a good run.
    - -                                                                                 */
func (pm *PM) pmRemoveSite(site string) error {
    if userMap, within := pm.passwordMap[site]; within {
        // Check if the size of users is less than 2:
        if len(userMap) < 2 {
            delete(pm.passwordMap, site)
            return nil
        }
        return fmt.Errorf("Attempted to remove multiple.")
    }
    return fmt.Errorf("Site not found.")
}


/** PM func :: pmRemove:                                                               - -
Remove a specific user from a site map, if after removing the user the map for that
site becomes empty, remove that site map entry in the overall PM struct map.
    - -                                                                                - -
    @param site  : A passed string to remove representing the site.
    @param user  : A passed string to remove representing the user.
    @return error: Possible error message, nil indicates a good run.
    - -                                                                                 */
func (pm *PM) pmRemove(site, user string) error {
    // Check if site exists:
    if _, exists := pm.passwordMap[site]; exists {
        // Check if user exists:
        if _, exists := pm.passwordMap[site][user]; exists {
            delete(pm.passwordMap[site], user)
            // Make sure map has removed emptied site maps:
            if len(pm.passwordMap[site]) == 0 {
                delete(pm.passwordMap, site)
            }
            return nil
        }
        return fmt.Errorf("User not found.")
    }
    return fmt.Errorf("Site not found.")
}


/** PM func :: pmWrite:                                                                - -
Writes to the passed fileName text file. Writes the map contents to the file.
    - -                                                                                - -
    @param fileName: A passed string representing the file name.
    @return error  : Possible error message, nil indicates a good run.
    - -                                                                                 */
func (pm *PM) pmWrite(fileName string) error {
    file, e := os.Create(fileName)  // File pointer get.
    if e != nil {
        return e
    }
    // Defer file closing in case of errors:
    defer file.Close()  

    // Format file:
    for site, userMap := range pm.passwordMap {
        for user, pass := range userMap {
            _, e := fmt.Fprintf(file, "%s %s %s\n", site, user, pass)
            if e != nil { return e }
        }
    }
    return nil
}


/** PM func :: pmRead:                                                                 - -
Given a filename, parse the file's contents line by line and retrieve the site, user,
and password fields. Create map entries within the pm struct.
    - -                                                                                - -
    @param fileName: A string representing the file to parse.
    @return error  : Possible error message, nil indicates a good run.
    - -                                                                                 */
func (pm *PM) pmRead(fileName string) error {
    file, e := os.Open(fileName)
    if e != nil { return e }
    defer file.Close()  // Defer closing of file in case of errors.
    scan := bufio.NewScanner(file)

    // For each line in the file:
    for scan.Scan() {   
        // Split each line based on whitespace delim:
        curLine := strings.Fields(scan.Text())
        site, user, pass := curLine[0], curLine[1], curLine[2]

        // Create map entry in master map if site key doesn't exist:
        if _, within := pm.passwordMap[site]; !within {
            pm.passwordMap[site] = make(map[string] string)
        }
        // Finally, add to master map:
        pm.passwordMap[site][user] = pass
    }
    return scan.Err()
}


/** func :: main:                                                                      - -
Entrypoint of program, we create the initial data structure to hold the password
manager's data. Main will read the "passwordVault" file and add the needed entries.
Main will also ask the user for input and parse said input to do the function needed.
    - -                                                                                 */
func main() {
    // Initialize pm struct:
    pm, fileName := pmCreate(), "passwordVault"

    // Read file and check for errors:
    if e := pm.pmRead(fileName); e != nil {
        fmt.Printf("pmRead :: %v\n", e)
    }

    // Main program loop:
    scan := bufio.NewScanner(os.Stdin)
    for {
        // Parse user command input:
        fmt.Print("Enter command: ")
        scan.Scan()
        command := scan.Text()
        args := strings.Fields(command) // Split command string into slice.

        if len(args) == 0 {
            fmt.Println("INPUT :: Empty input.")
            continue
        }

        // Direct user input to correct function using a switch:
        switch args[0] {

        // pmList
        case "l":
            if len(args) != 1 {
                fmt.Println("LIST :: Command argument not form: l")
                continue
            }
            pm.pmList()

        // pmAdd:
        case "a": 
            if len(args) != 4 {
                fmt.Println("ADD :: Command argument not form: a site user password.")
                continue
            }
            e := pm.pmAdd(args[1], args[2], args[3])
            if e != nil {
                fmt.Printf("ADD :: %v\n", e)
            }
            if e := pm.pmWrite(fileName); e != nil {
                fmt.Printf("WRITE :: %v\n", e)
            }

        // pmRemove:
        case "r":
            // r site
            if len(args) == 2 {
                e := pm.pmRemoveSite(args[1])
                if e != nil {
                    fmt.Printf("REMOVE :: %v\n", e)
                    continue
                }
                if e := pm.pmWrite(fileName); e != nil {
                    fmt.Printf("WRITE :: %v\n", e)
                }
                continue
            }
            // r site user
            if len(args) == 3 {
                e := pm.pmRemove(args[1], args[2])
                if e != nil {
                    fmt.Printf("REMOVE :: %v\n", e)
                    continue
                }
                if e := pm.pmWrite(fileName); e != nil {
                    fmt.Printf("WRITE :: %v\n", e)
                }
            } else {
                fmt.Println("REMOVE :: Command argument not form: r site OR r site user.")
                continue
            }

        // Exit loop:
        case "x":
            os.Exit(0)

        // Invalid command passed:
        default:
            fmt.Println("INPUT :: Please use 'a', 'r', 'l', or 'x'.")
        }
    }
}