package com.hakilisoft.asuivre.operations.frwk;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.SQLExec;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;

import com.hakilisoft.asuivre.operations.domain.BusinessKey;
import com.hakilisoft.asuivre.operations.domain.OAUser;
import com.hakilisoft.asuivre.operations.domain.OAUserJSON;

public class OAUtils {


	public static final String DB_PERSISTENCE_UNIT = "persistenceUnit";
	
	public static final String DB_DATASOURCE_TENANT_ID_1 = "tenantDS1";
	
	public static final String DB_DATASOURCE_TENANT_ID_2 = "tenantDS2";

	public static final String DB_DATASOURCE_TENANT_ID_3 = "tenantDS3";

	public static final String DB_DATASOURCE_TENANT_ID_4 = "tenantDS4";
	
	
	public static final String OPERATIONS_DEFAULT_BK = "Operations";
	
	/**
	 * Logging system
	 * */
	private static Logger logger = Logger.getLogger(OAUtils.class); 
	
	/**
	 * Keys in the 'message.properties' resource bundle. They represent the activity stream to be logged in @Suivre Operations central database  
	 * */
	public static final String OA_ACTIVITYSTREAM_TENANT_ORGANIZATION_ASSIGNMENT_MSG = "oa_activitystream_tenant_organization_assignment";
	public static final String OA_ACTIVITYSTREAM_GROUP_CREATION_MSG = "oa_activitystream_group_creation";
	public static final String OA_ACTIVITYSTREAM_USER_CREATION_MSG = "oa_activitystream_user_creation";
	
	
	public OAUtils() {
	}

	/**
	 * Ascending sort of a {@link BusinessKey} Collection
	 * */
	public static List<BusinessKey> sortBusinessKeys(Collection<BusinessKey> businessKeys) {
		List<BusinessKey> keys = new ArrayList<BusinessKey>();
		keys.addAll(businessKeys);
		Collections.sort(keys, new Comparator<BusinessKey>() {
			public int compare(BusinessKey b1, BusinessKey b2) {
				return b1.getName().compareTo(b2.getName());
			}
		});
		
		return keys;
	}
	
	/**
	 * Allows to run an SQL script from within our system. 
	 * This is basically done via an Ant built-in Task
	 * */
	public static void executeSql(String sqlFilePath, String driver, String url, String userName, String password) {
	    final class SqlExecuter extends SQLExec {
	        public SqlExecuter() {
	            Project project = new Project();
	            project.init();
	            setProject(project);
	            setTaskType("sql");
	            setTaskName("sql");
	        }
	    }
	    
	    SqlExecuter executer = new SqlExecuter();
	    executer.setSrc(new File(sqlFilePath));
	    executer.setDriver(driver);
	    executer.setUrl(url);
	    executer.setUserid(userName);
	    executer.setPassword(password);
	    executer.execute();
	}
	
	/**
	 * Create a JSON representation of a OAUser Set as a String
	 * */
	public static String createOAUserJSONAsString(List<OAUser> users) {
		// configure to avoid timestamp representation
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(SerializationConfig.Feature.WRITE_DATES_AS_TIMESTAMPS, false);
		String json = null;
		try {
			json = mapper.writeValueAsString(createUserJSONSet(users));
			logger.debug("createOAUserJSONAsString() - Got Json for Dossier : " + json);
		} catch (IOException e) {
			logger.error("createOAUserJSONAsString() - Failed mapping Dossier into JSON. Cause: \n", e);
		}
		
    	return json;
	}
	
    /**
   	 * Create a representation of a User Set that can be serialized into JSON
        * */
       public static Set<OAUserJSON> createUserJSONSet(List<OAUser> users ) {
    	   
       	Set<OAUserJSON> userJSONs = new HashSet<OAUserJSON>();
       	
       	for (OAUser user : users) {
       		
   			OAUserJSON userJSON = new OAUserJSON();
   			
   			userJSON.setId(user.getId());
   			userJSON.setUserName(user.getUserName());
   			userJSON.setFirstName(user.getFirstName());
   			userJSON.setLastName(user.getLastName());
   			userJSONs.add(userJSON);
   			
   		}
       	return userJSONs;
       }
}
