#include<iostream>

using namespace std;

class OnlineExample {
    private:
        string s;
    public:
        // Constructor
        OnlineExample(const string & str="") : s(str) {
            cout << "Constructor for " << s << endl;
        }
        // Destructor
        ~OnlineExample() {
            cout << "Destructor for " << s << endl;
        }
};

void exampleFunction(OnlineExample functionParameterObject) {
    cout << "-- Start of exampleFunction() --" << endl;
    OnlineExample functionLocalVar("function local stack");
    static OnlineExample functionStaticVar("function local static");
    cout << "--- End of exampleFunction() ---" << endl;
}

int main() {
    cout << "------- Start of main() -------" << endl;
    static OnlineExample staticObj("static object");
    OnlineExample stackObj("stack object");
    OnlineExample * heapObj = new OnlineExample("heap object");

    exampleFunction(staticObj);

    delete(heapObj);
    cout << "-------- End of main() --------" << endl;
    return(0);
}
