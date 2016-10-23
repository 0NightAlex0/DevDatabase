
package mongodbtest;
import com.mongodb.BasicDBObject;
import com.mongodb.BulkWriteOperation;
import com.mongodb.BulkWriteResult;
import com.mongodb.Cursor;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.ParallelScanOptions;
import com.mongodb.util.JSON;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;

import java.util.List;
import java.util.Random;
import java.util.Set;

import static java.util.concurrent.TimeUnit.SECONDS;

/**
 *
 * @author Alex
 */
public class MongoDBTest {


    public static void main(String[] args) throws UnknownHostException {
        DB db = (new MongoClient("localhost",27017)).getDB("Hro");//database
        DBCollection colEmployee = db.getCollection("Employee");//table
        List<String> listName = new ArrayList<>(Arrays.asList("Peter","Jay","Mike","Sally","Michel","Bob","Jenny"));
        List<String> listSurname = new ArrayList<>(Arrays.asList("Ra","Grey","Uks","Bla","Woo","Foo","Lu"));
        List<String> listOccupation = new ArrayList<>(Arrays.asList("Analyst","Developer","Tester"));
        List<String> listHours = new ArrayList<>(Arrays.asList("4","5","6","19","20","21"));
        for(int i = 1000; i < 2000;i++){
            	String json = "{'e_bsn': '" + Integer.toString(i) + "', 'Name':'" + getRandomItem(listName) +"','Surname':'" + getRandomItem(listSurname) +"'"
                    + ",'building_name':'H-Gebouw'"
                    + ",'address':[{'country': 'Nederland','Postal_code':'3201TL','City':'Spijkenisse','Street':'Wagenmaker','house_nr':25},"
                    + "{'country': 'Nederland','Postal_code':'3201RR','City':'Spijkenisse','Street':'Slaanbreek','house_nr':126}],"
                    + "'Position_project': [{'p_id': 'P" + Integer.toString(i) + "','position_project':'"+ getRandomItem(listOccupation)
                    +"', 'worked_hours':"+ Integer.parseInt(getRandomItem(listHours)) +"}],"
                    + "'degree_employee': [{'Course':'Informatica','School':'HogeSchool Rotterdam','Level':'Bachelorr'}]}";
                
                DBObject dbObject = (DBObject)JSON.parse(json);//parser
                colEmployee.insert(dbObject);// insert in database
                
                BasicDBObject fields = new BasicDBObject();
                fields.put("Position_project.worked_hours", 1);//get only 1 field
                
                BasicDBObject uWQuery = new BasicDBObject();
                uWQuery.put("Position_project.worked_hours", new BasicDBObject("$gt", -1).append("$lt", 5));//underworking
                
                BasicDBObject nWQuery = new BasicDBObject();
                nWQuery.put("Position_project.worked_hours", new BasicDBObject("$gte", 5).append("$lte", 20));//working normal
                
                BasicDBObject oWQuery = new BasicDBObject();
                oWQuery.put("Position_project.worked_hours", new BasicDBObject("$gt", 20));//overwork
                
                DBCursor cursorDocJSON = colEmployee.find(oWQuery,fields); //get documents
            while (cursorDocJSON.hasNext()) {
                   System.out.println(cursorDocJSON.next());
            }
            colEmployee.remove(new BasicDBObject());
        }
    }
    static Random rand = new Random();
    
    static <T> T getRandomItem(List<T> list) {
        return list.get(rand.nextInt(list.size()));
    }
}
