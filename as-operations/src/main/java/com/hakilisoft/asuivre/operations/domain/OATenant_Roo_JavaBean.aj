// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hakilisoft.asuivre.operations.domain;

import com.hakilisoft.asuivre.operations.domain.OATenant;
import com.hakilisoft.asuivre.operations.domain.OAUser;
import java.util.Date;
import java.util.List;

privileged aspect OATenant_Roo_JavaBean {
    
    public String OATenant.getName() {
        return this.name;
    }
    
    public void OATenant.setName(String name) {
        this.name = name;
    }
    
    public String OATenant.getBusinessKey() {
        return this.businessKey;
    }
    
    public void OATenant.setBusinessKey(String businessKey) {
        this.businessKey = businessKey;
    }
    
    public Date OATenant.getCreationDate() {
        return this.creationDate;
    }
    
    public void OATenant.setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
    
    public Date OATenant.getModificationDate() {
        return this.modificationDate;
    }
    
    public void OATenant.setModificationDate(Date modificationDate) {
        this.modificationDate = modificationDate;
    }
    
    public String OATenant.getCreatedBy() {
        return this.createdBy;
    }
    
    public void OATenant.setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
    
    public String OATenant.getModifiedBy() {
        return this.modifiedBy;
    }
    
    public void OATenant.setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
    
    public List<OAUser> OATenant.getUsers() {
        return this.users;
    }
    
    public void OATenant.setUsers(List<OAUser> users) {
        this.users = users;
    }
    
}