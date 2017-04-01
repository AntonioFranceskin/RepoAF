require 'rest-client'
require 'json'


class Digg


def digggets(store,k)
begin
     r = RestClient.get 'http://digg.com/api/news/popular.json'
		rescue RestClient::ExceptionWithResponse => e
     		e.response
end
link = JSON.parse(r.body)
 for  i  in  0..link["data"]["feed"].length-1 
 	store[k] = []
#    store[k][0] =  Time.at(link["data"]["feed"][i]["date"])
    store[k][0] = link["data"]["feed"][i]["date"]
    store[k][1] = link["data"]["feed"][i]["content"]["author"]
    store[k][2] = link["data"]["feed"][i]["content"]["url"]
	store[k][3] = link["data"]["feed"][i]["content"]["title_alt"]
	store[k][4] = "Digg"
	k = k + 1
    end
return k    
end     
end

