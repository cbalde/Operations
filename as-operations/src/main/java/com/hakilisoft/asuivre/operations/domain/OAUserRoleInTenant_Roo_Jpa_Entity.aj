// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hakilisoft.asuivre.operations.domain;

import com.hakilisoft.asuivre.operations.domain.OAUserRoleInTenant;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

privileged aspect OAUserRoleInTenant_Roo_Jpa_Entity {
    
    declare @type: OAUserRoleInTenant: @Entity;
    
    declare @type: OAUserRoleInTenant: @Table(name = "OA_USER_ROLE_IN_TENANT");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long OAUserRoleInTenant.id;
    
    @Version
    @Column(name = "version")
    private Integer OAUserRoleInTenant.version;
    
    public Long OAUserRoleInTenant.getId() {
        return this.id;
    }
    
    public void OAUserRoleInTenant.setId(Long id) {
        this.id = id;
    }
    
    public Integer OAUserRoleInTenant.getVersion() {
        return this.version;
    }
    
    public void OAUserRoleInTenant.setVersion(Integer version) {
        this.version = version;
    }
    
}
