#include <iostream>
#include <fstream>
#include <cstring>
#include <linux/input.h>

using namespace std;

//structure to hold event info
struct input_event event;

int main(int argc, char *argv[]) {
    cout << "Receiving Keyboard Presses!" << endl;
   	 
    //open the file for reading
    ifstream file("/dev/input/mice");
    
    //temp storage for event
    char data[sizeof(event)+1] = { 0, };
    
    //check if file opened!
    if(file.is_open()) {
        
        //lets loop until esc key
        bool session = true;
        while(session) {
           	printf("%d\n", file.is_open()); 
            //lets get to work
            file.read(data, sizeof(event));
           	printf("hello,\n"); 
            //now copy the data to the struct
            memcpy(&event, data, sizeof(event));
           	printf("%s", data); 
            //now lets read the event
            //event type
            if(event.type == EV_KEY) {
                
                //its a keyboard event
                //was it the esc key?
                if(event.code == KEY_ESC) {
                    
                    cout << "The Escape Key Was Pushed!" << endl;
                    session = false;
                }
                else {
                    
                    cout << "Key Press " << event.code << endl;
                }
            }
        }
        
        //dont forget to close the file
        file.close();
    }
    else {
        
        cout << "Unable to open file!" << endl;
        return 1;
    }
    
    return 0;
}
