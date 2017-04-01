
require 'rest-client'
require 'json'
require 'date'
class Mashable

def mashablegets(store,k)
begin
     r = RestClient.get 'http://mashable.com/stories.json'
        rescue RestClient::ExceptionWithResponse => e
            e.response
end
link = JSON.parse(r.body)
    for i  in  0..link["new"].length-1
        store[k] = []
        store[k][0] = DateTime.rfc3339(link["new"][i]["post_date"]).to_time.to_i
#       fecha2 = DateTime.rfc3339(fecha).to_time.to_i
        store[k][1] = link["new"][i]["author"]
        store[k][2] = link["new"][i]["link"]
        store[k][3] = link["new"][i]["title"]
        store[k][4] = "Mashable"
        k = k + 1
    end
return k    
end
end
