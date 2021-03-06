// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.hakilisoft.asuivre.operations.web;

import com.hakilisoft.asuivre.operations.domain.OATenant;
import com.hakilisoft.asuivre.operations.domain.OAUser;
import com.hakilisoft.asuivre.operations.web.OATenantController;
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

privileged aspect OATenantController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String OATenantController.create(@Valid OATenant OATenant_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, OATenant_);
            return "oatenants/create";
        }
        uiModel.asMap().clear();
        OATenant_.persist();
        return "redirect:/oatenants/" + encodeUrlPathSegment(OATenant_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String OATenantController.createForm(Model uiModel) {
        populateEditForm(uiModel, new OATenant());
        return "oatenants/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String OATenantController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("oatenant_", OATenant.findOATenant(id));
        uiModel.addAttribute("itemId", id);
        return "oatenants/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String OATenantController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("oatenants", OATenant.findOATenantEntries(firstResult, sizeNo));
            float nrOfPages = (float) OATenant.countOATenants() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("oatenants", OATenant.findAllOATenants());
        }
        addDateTimeFormatPatterns(uiModel);
        return "oatenants/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String OATenantController.update(@Valid OATenant OATenant_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, OATenant_);
            return "oatenants/update";
        }
        uiModel.asMap().clear();
        OATenant_.merge();
        return "redirect:/oatenants/" + encodeUrlPathSegment(OATenant_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String OATenantController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, OATenant.findOATenant(id));
        return "oatenants/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String OATenantController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        OATenant OATenant_ = OATenant.findOATenant(id);
        OATenant_.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/oatenants";
    }
    
    void OATenantController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("OATenant__creationdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("OATenant__modificationdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void OATenantController.populateEditForm(Model uiModel, OATenant OATenant_) {
        uiModel.addAttribute("OATenant_", OATenant_);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("oausers", OAUser.findAllOAUsers());
    }
    
    String OATenantController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
