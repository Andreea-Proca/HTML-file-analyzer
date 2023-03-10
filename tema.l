/* Proca Andreea-Dana 332CC */
/* Declaration section*/
%{
    #include <string.h>        // for string handling 
    #include <ctype.h>         // for character predicates
    #include <stdlib.h>
    #include <stdio.h>
    #include <math.h>
    #include <string.h>
    #include <map>
    #include <vector>
    #include <iostream>
    #include <algorithm>
    using namespace std;

    map<string, vector<string>> styleMap;
    map<string, map<string, vector<string>>> bodyMap;
    int countDiv = 0;
    string tag1, tag2;
%}
  
%%
"<style>" {} // tag style

"div {" {
        pair<string, vector<string>> p;
        vector<string> v;
        p = make_pair("<div>", v);
        styleMap.insert(p);
        tag2 = "<div>";
        } // tag div in style

"h1 {" {
        pair<string, vector<string>> p;
        vector<string> v;
        p = make_pair("<h1>", v);
        styleMap.insert(p);
        tag2 = "<h1>"; 
        } // tag h in style

"p {" {
        pair<string, vector<string>> p;
        vector<string> v;
        p = make_pair("<p>", v);
        styleMap.insert(p);
        tag2 = "<p>";
        } // tag p in style

"  color" {
            styleMap.find(tag2)->second.push_back("color");
            }

"  font-family:" {
                styleMap.find(tag2)->second.push_back("font-family");
                }

"  font-size:" {
                styleMap.find(tag2)->second.push_back("font-size");
                } 
            
"  border:" {
                styleMap.find(tag2)->second.push_back("border");
                }

"  background-color:" {
                styleMap.find(tag2)->second.push_back("background-color");
                }

"  text-align:" {
                styleMap.find(tag2)->second.push_back("text-align");
                }

"<body"[^>]*">" {} // tag body

"<div" {
        pair<string, map<string, vector<string>>> p;
        string s = "<div" + to_string(++countDiv) + ">";
        map<string, vector<string>> m;
        p = make_pair(s, m);
        bodyMap.insert(p);
        } //tag div in body

"<h"[^>]*">" {
                pair<string, map<string, vector<string>>> p;
                map<string, vector<string>> m;
                p = make_pair(yytext, m);
                bodyMap.insert(p);
                } //tag h in body

"<p"[^>]*">" {
                pair<string, map<string, vector<string>>> p;
                map<string, vector<string>> m;
                p = make_pair(yytext, m);
                bodyMap.insert(p);
                } // tag p in body

"  <h1" {
            pair<string, vector<string>> p;
            vector<string> l;
            p = make_pair("<h1>", l);
            bodyMap.find("<div" + to_string(countDiv) + ">")->second.insert(p);
            } // tag h1 in div

"  <h2" {
            pair<string, vector<string>> p;
            vector<string> l;
            p = make_pair("<h2>", l);
            bodyMap.find("<div" + to_string(countDiv) + ">")->second.insert(p);
            } // tag h2 in div

"  <p" {
            pair<string, vector<string>> p;
            vector<string> l;
            p = make_pair("<p>", l);
            bodyMap.find("<div" + to_string(countDiv) + ">")->second.insert(p);
            } // tag p in div

"  <label" {
            pair<string, vector<string>> p;
            vector<string> l;
            p = make_pair("<label>", l);
            bodyMap.find("<div" + to_string(countDiv) + ">")->second.insert(p);
            tag2 = "<label>";
            } // tag label in div

"  <input" {
            pair<string, vector<string>> p;
            vector<string> l;
            p = make_pair("<input>", l);
            bodyMap.find("<div" + to_string(countDiv) + ">")->second.insert(p);
            tag2 = "<input>";
            } // tag input in div

"  <button" {
            pair<string, vector<string>> p;
            vector<string> l;
            p = make_pair("<button>", l);
            bodyMap.find("<div" + to_string(countDiv) + ">")->second.insert(p);
            tag2 = "<button>";
            } // tag button in div   

"  <span" {
            pair<string, vector<string>> p;
            vector<string> l;
            p = make_pair("<span>", l);
            bodyMap.find("<div" + to_string(countDiv) + ">")->second.insert(p);
            tag2 = "<span>";
            } // tag span in div

"  <img" {
            pair<string, vector<string>> p;
            vector<string> l;
            p = make_pair("<img>", l);
            bodyMap.find("<div" + to_string(countDiv) + ">")->second.insert(p);
            tag2 = "<img>";
            } // tag img in div

" for=" {
            string f = "for";
            vector<string> v = bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second;
            if (!std::count(v.begin(), v.end(), f))
                bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second.push_back(f);
            }

" type=" {
            string f = "type";
            vector<string> v = bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second;
            if (!std::count(v.begin(), v.end(), f))
                bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second.push_back(f);
            }

" placeholder=" {
                string f = "placeholder";
                vector<string> v = bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second;
                if (!std::count(v.begin(), v.end(), f))
                    bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second.push_back(f);
                }

" name=" {
            string f = "name";
            vector<string> v = bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second;
            if (!std::count(v.begin(), v.end(), f))
                bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second.push_back(f);
            }

" checked=" {
            string f = "checked";
            vector<string> v = bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second;
            if (!std::count(v.begin(), v.end(), f))
                bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second.push_back(f);
            }

" class=" {
            string f = "class";
            vector<string> v = bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second;
            if (!std::count(v.begin(), v.end(), f))
                bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second.push_back(f);
            }

" src=" {
            string f = "src";
            vector<string> v = bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second;
            if (!std::count(v.begin(), v.end(), f))
                bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second.push_back(f);
            }

" alt=" {
            string f = "alt";
            vector<string> v = bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second;
            if (!std::count(v.begin(), v.end(), f))
                bodyMap.find("<div" + to_string(countDiv) + ">")->second.find(tag2)->second.push_back(f);
            }

. ;  // else do nothing

"</html>"   {return 0;}

"</body>"   {return 0;}
%%    
  
int yywrap(){return 0;}
       
int main(int argc, char*argv[])
{
    extern FILE *yyin;
    yyin = fopen(argv[1],"r"); 
  
    yylex();

    map<string, vector<string>>::iterator itS;
    if(!styleMap.empty()) {
        cout << "Tagurile din style: ";
        for (itS = styleMap.begin(); itS != styleMap.end(); itS++) {
            cout << itS -> first << ",";
    }
    cout << endl;
    }

    cout << "Tagurile din body: [";
    map<string, map<string, vector<string>>>::iterator it;
    for (it = bodyMap.begin(); it != bodyMap.end(); it++)
        if (it->first != "<head>" && it->first != "<html>") {
            cout << it-> first << ",";
        }
    cout << "]" << endl;

    cout << "Tagurile din div: [\n";
    for (it = bodyMap.begin(); it != bodyMap.end(); it++) {
        if (it->first != "<head>" && it->first != "<html>" && it->first[1] == 'd') {
            cout << it->first << "->[";
            map<string, vector<string>>::iterator it2;
            for (it2 = it->second.begin(); it2 != it->second.end(); it2++)
                cout << it2->first << ",";     
            cout << "]" << endl;
        }
    }
    cout << "]" << endl; 

    cout << "\nLista atribute div: [\n";
    for (it = bodyMap.begin(); it != bodyMap.end(); it++) {
        if (it->first != "<head>" && it->first != "<html>") {
            map<string, vector<string>>::iterator it2;
            for (it2 = it->second.begin(); it2 != it->second.end(); it2++) {
                cout << it->first << "->" << it2->first;
                vector<string> v = it2->second;
                if (v.size() != 0) {
                    cout << "->";
                    for (int i = 0 ; i < v.size(); i++)
                        cout << v[i] << ",";
                }
                cout << endl;
            }
            cout << endl; 
        }
    }
    cout << "]" <<endl;

    if (!styleMap.empty()) {
        cout << "Lista atribute style: [";
        for (itS = styleMap.begin(); itS != styleMap.end(); itS++) {
            cout << itS->first << ": [";
            for (int i = 0; i < itS->second.size(); i++)
                cout << itS->second[i] << ",";
            cout << "]" << endl;
        }
    }
    cout << "]" << endl;
    return 0;
}