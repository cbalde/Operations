// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hakilisoft.asuivre.operations.domain;

import com.hakilisoft.asuivre.operations.domain.OAUser;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OAUser_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager OAUser.entityManager;
    
    public static final EntityManager OAUser.entityManager() {
        EntityManager em = new OAUser().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long OAUser.countOAUsers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM OAUser o", Long.class).getSingleResult();
    }
    
    public static List<OAUser> OAUser.findAllOAUsers() {
        return entityManager().createQuery("SELECT o FROM OAUser o", OAUser.class).getResultList();
    }
    
    public static OAUser OAUser.findOAUser(Long id) {
        if (id == null) return null;
        return entityManager().find(OAUser.class, id);
    }
    
    public static List<OAUser> OAUser.findOAUserEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM OAUser o", OAUser.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void OAUser.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void OAUser.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            OAUser attached = OAUser.findOAUser(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void OAUser.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void OAUser.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public OAUser OAUser.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        OAUser merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
