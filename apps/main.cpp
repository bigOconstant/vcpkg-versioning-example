#include <iostream>
#include <cpr/cpr.h>

#include "rapidjson/document.h"
#include "rapidjson/writer.h"
#include "rapidjson/stringbuffer.h"

using std::cout;
using std::endl;
using rapidjson::Document;
int main() {

  cout<<"starting example app"<<endl;

  cpr::Response r = cpr::Post(cpr::Url{"https://httpbin.org/post"},
                   cpr::Payload{{"key", "You posted this to variable key"}});

   cout<< r.error.message<<endl;

 

   Document d;
   d.Parse(r.text.c_str());

  
   cout<<d["form"]["key"].GetString()<<endl;
  
  return 0;
}
