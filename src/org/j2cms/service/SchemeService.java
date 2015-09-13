package org.j2cms.service;

import org.j2cms.model.scheme.Scheme;
import org.j2cms.service.base.DAO;

public interface SchemeService extends DAO<Scheme> {

	public Scheme getSchemeByProjectId(Integer id);
}
