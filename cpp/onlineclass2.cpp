#include<iostream>

using namespace std;

class OnlineExample {
    private:
        string s;
        int * x;
        int * y;
    public:
        // Constructor
        OnlineExample(int a, int b, const string & str="") : s(str) {
            cout << "Constructor for " << s << " a=" << a << " b=" << b << endl;
            x = new int(a);
            y = new int[b];
            for (int ii=0;ii<b;ii++) {
                y[ii]=ii+a;
            }
        }
        // Destructor
        ~OnlineExample() {
            cout << "Destructor for " << s << endl;
            delete(x);
            delete[](y);
        }
};

void exampleFunction(const OnlineExample &functionParameterObject) {
    cout << "-- Start of exampleFunction() --" << endl;
    OnlineExample functionLocalVar(3, 6, "function local stack");
    static OnlineExample functionStaticVar(2, 4, "function local static");
    cout << "--- End of exampleFunction() ---" << endl;
}

int main() {

    int var = 10;
    int * intPtr = new int(20);
    int ** intPtrPtr = new int *;
    *intPtrPtr = new int(30);
    int * arrPtr = new int[5];

    for (int ii=0;ii<5;ii++) {
        arrPtr[ii] = ii+1;
    }

    cout << "variable var: " << var << " address: " << &var << endl;
    cout << "pointer intPtr: " << intPtr << " dereferenced: " << *intPtr << " address: " << &intPtr << endl;
    cout << "pointer to pointer intPtrPtr: " << intPtrPtr << " dereferenced: " << *intPtrPtr << 
               " double dereferenced: " << **intPtrPtr << " address: " << &var << endl;
    cout << "pointer arrPtr: " << arrPtr << " dereferenced: " << *arrPtr << " address: " << &arrPtr << "  values: ";
    for (int ii=0;ii<5;ii++) {
        cout << arrPtr[ii] << " ";
    }
    cout << endl << endl;

    cout << "------- Start of main() -------" << endl;
    static OnlineExample staticObj(6, 12, "static object");
    OnlineExample stackObj(5, 10, "stack object");
    OnlineExample * heapObj = new OnlineExample(4, 8, "heap object");

    exampleFunction(staticObj);

    delete(heapObj);
    delete(intPtr);
    delete(intPtrPtr);
    delete[](arrPtr);

    cout << "-------- End of main() --------" << endl;
    return(0);
}
