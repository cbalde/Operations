// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hakilisoft.asuivre.operations.domain;

import com.hakilisoft.asuivre.operations.domain.OAGroup;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

privileged aspect OAGroup_Roo_Jpa_Entity {
    
    declare @type: OAGroup: @Entity;
    
    declare @type: OAGroup: @Table(name = "OA_GROUP");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long OAGroup.id;
    
    @Version
    @Column(name = "version")
    private Integer OAGroup.version;
    
    public Long OAGroup.getId() {
        return this.id;
    }
    
    public void OAGroup.setId(Long id) {
        this.id = id;
    }
    
    public Integer OAGroup.getVersion() {
        return this.version;
    }
    
    public void OAGroup.setVersion(Integer version) {
        this.version = version;
    }
    
}
