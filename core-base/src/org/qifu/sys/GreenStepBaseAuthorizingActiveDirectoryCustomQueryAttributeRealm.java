/* 
 * Copyright 2012-2018 qifu of copyright Chen Xin Nien
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * -----------------------------------------------------------------------
 * 
 * author: 	Chen Xin Nien
 * contact: chen.xin.nien@gmail.com
 * 
 */
package org.qifu.sys;

import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.LdapContext;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.realm.ldap.LdapContextFactory;
import org.apache.shiro.realm.ldap.LdapUtils;

public class GreenStepBaseAuthorizingActiveDirectoryCustomQueryAttributeRealm extends GreenStepBaseAuthorizingActiveDirectoryRealm {
	
	public GreenStepBaseAuthorizingActiveDirectoryCustomQueryAttributeRealm() {
		super();
	}
	
    @Override
    protected AuthenticationInfo queryForAuthenticationInfo(AuthenticationToken token, LdapContextFactory ldapContextFactory) throws NamingException {
        final GreenStepBaseUsernamePasswordToken usernamePasswordToken = (GreenStepBaseUsernamePasswordToken) token;
        LdapContext ctx = null;
        try {
        	ctx = ldapContextFactory.getSystemLdapContext();
            final String attribName = "userPrincipalName";
            final SearchControls searchControls = new SearchControls(SearchControls.SUBTREE_SCOPE, 1, 0, new String[] { attribName }, false, false);
            final NamingEnumeration<SearchResult> search = ctx.search(searchBase, this.getCustomQueryAttributeValue(), new Object[] { usernamePasswordToken.getPrincipal() }, searchControls);
            if (search.hasMore()) {
            	final SearchResult next = search.next();
                String loginUser= next.getAttributes().get(attribName).get().toString();
                if (search.hasMore()) {
                    throw new RuntimeException("More than one user matching: "+usernamePasswordToken.getPrincipal());
                } else {
                    try {
                    	ldapContextFactory.getLdapContext(loginUser, usernamePasswordToken.getPassword());
                    } catch (Exception ex) {
                        throw ex;
                    }
                }
            }
            else {
                throw new RuntimeException("No user matching: " + usernamePasswordToken.getPrincipal());
            }
        } catch (NamingException ne) {
            throw ne;
        } finally {
            LdapUtils.closeContext(ctx);
        }
        return buildAuthenticationInfo(usernamePasswordToken.getUsername(), usernamePasswordToken.getPassword());
    }		
    
}
