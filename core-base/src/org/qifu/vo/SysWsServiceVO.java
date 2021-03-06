/* 
 * Copyright 2012-2016 bambooCORE, greenstep of copyright Chen Xin Nien
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
package org.qifu.vo;

import org.qifu.base.model.BaseValueObj;

public class SysWsServiceVO extends BaseValueObj implements java.io.Serializable {
	private static final long serialVersionUID = 202296381611884185L;
	private String oid;
	private String id;
	private String system;
	private String beanId;
	private String wsdlAddress;
	private String description;
	
	public SysWsServiceVO() {
		
	}
	
	public SysWsServiceVO(String oid, String id, String system, String beanId,
			String wsdlAddress) {
		super();
		this.oid = oid;
		this.id = id;
		this.system = system;
		this.beanId = beanId;
		this.wsdlAddress = wsdlAddress;
	}

	public SysWsServiceVO(String oid, String id, String system, String beanId,
			String wsdlAddress, String description) {
		super();
		this.oid = oid;
		this.id = id;
		this.system = system;
		this.beanId = beanId;
		this.wsdlAddress = wsdlAddress;
		this.description = description;
	}

	@Override
	public String getOid() {
		return this.oid;
	}
	
	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSystem() {
		return system;
	}

	public void setSystem(String system) {
		this.system = system;
	}

	public String getBeanId() {
		return beanId;
	}

	public void setBeanId(String beanId) {
		this.beanId = beanId;
	}

	public String getWsdlAddress() {
		return wsdlAddress;
	}

	public void setWsdlAddress(String wsdlAddress) {
		this.wsdlAddress = wsdlAddress;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
