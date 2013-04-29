// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hakilisoft.asuivre.operations.web;

import com.hakilisoft.asuivre.operations.domain.OAGroup;
import com.hakilisoft.asuivre.operations.domain.OATenant;
import com.hakilisoft.asuivre.operations.domain.OAUser;
import com.hakilisoft.asuivre.operations.web.OAUserController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect OAUserController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String OAUserController.create(@Valid OAUser OAUser_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, OAUser_);
            return "oausers/create";
        }
        uiModel.asMap().clear();
        OAUser_.persist();
        return "redirect:/oausers/" + encodeUrlPathSegment(OAUser_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String OAUserController.createForm(Model uiModel) {
        populateEditForm(uiModel, new OAUser());
        return "oausers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String OAUserController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("oauser_", OAUser.findOAUser(id));
        uiModel.addAttribute("itemId", id);
        return "oausers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String OAUserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("oausers", OAUser.findOAUserEntries(firstResult, sizeNo));
            float nrOfPages = (float) OAUser.countOAUsers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("oausers", OAUser.findAllOAUsers());
        }
        addDateTimeFormatPatterns(uiModel);
        return "oausers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String OAUserController.update(@Valid OAUser OAUser_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, OAUser_);
            return "oausers/update";
        }
        uiModel.asMap().clear();
        OAUser_.merge();
        return "redirect:/oausers/" + encodeUrlPathSegment(OAUser_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String OAUserController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, OAUser.findOAUser(id));
        return "oausers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String OAUserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        OAUser OAUser_ = OAUser.findOAUser(id);
        OAUser_.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/oausers";
    }
    
    void OAUserController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("OAUser__creationdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("OAUser__modificationdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void OAUserController.populateEditForm(Model uiModel, OAUser OAUser_) {
        uiModel.addAttribute("OAUser_", OAUser_);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("oagroups", OAGroup.findAllOAGroups());
        uiModel.addAttribute("oatenants", OATenant.findAllOATenants());
    }
    
    String OAUserController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}