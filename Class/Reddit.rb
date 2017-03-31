require 'rest-client'
require 'json'

class Reddit

def redditgets(store,k)
begin
     r  = RestClient.get 'https://www.reddit.com/.json'
rescue RestClient::ExceptionWithResponse => e
     e.response
end     
 link = JSON.parse(r.body)
   for  i  in  0..link["data"]["children"].length-1
     store[k] = []
#     store[k][0] = Time.at(link["data"]["children"][i]["data"]["created"])
     store[k][0] = link["data"]["children"][i]["data"]["created"]    
     store[k][1] = link["data"]["children"][i]["data"]["author"]
	 store[k][2] = link["data"]["children"][i]["data"]["url"]
     store[k][3] = link["data"]["children"][i]["data"]["title"]
     store[k][4] = "Reddit"
     k = k + 1
   end
 return k  
end
end