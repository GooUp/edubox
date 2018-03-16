/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edutechservices;

//import edutechentities.common.GroupEntity;
import commoninfraentities.UserEntity;
import edutechentities.group.GroupEntity;
import edutechentities.module.SessionEntity;
import edutechsessionbeans.CommonRESTMgrBean;
import edutechsessionbeans.GroupRESTMgrBean;
import edutechsessionbeans.ModuleRESTMgrBean;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author nanda88
 */
@RequestScoped
@Path("session")
public class SessionREST {
    
    @EJB
    CommonRESTMgrBean cmb;
    @EJB
    GroupRESTMgrBean etr;
    @EJB
    ModuleRESTMgrBean mmb;
    
    @GET @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<SessionEntity> getAllSessions() {
        return mmb.getAllSessions();
    }
    
    @GET @Path("{id}") @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public SessionEntity getOneSession(@PathParam("id") String id){
        return mmb.getOneSession(Long.valueOf(id));
    }
    
    @POST @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public SessionEntity createSession(SessionEntity mm) {
        return mmb.createSession(mm);
    }
    
    @DELETE @Path("{id}") @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void deleteSession(@PathParam("id") String id) {
        mmb.deleteSession(Long.valueOf(id));
    }
    
    @PUT @Path("{id}") @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public SessionEntity editSession(@PathParam("id") String id, SessionEntity replacement){
        return mmb.editSession(Long.valueOf(id), replacement);
    }

}
