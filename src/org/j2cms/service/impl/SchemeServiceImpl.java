package org.j2cms.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.j2cms.model.scheme.Scheme;
import org.j2cms.service.SchemeService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class SchemeServiceImpl extends DaoSupport<Scheme> implements
		SchemeService {

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)//查询不需要开事务
	public Scheme getSchemeByProjectId(Integer id) {
		// TODO Auto-generated method stub
		String entityname = getEntityName(this.entityClass);
		Query query = em.createQuery("select o from " +entityname+" o where o.project.id=?");
		query.setParameter(1, id);
		List<Scheme> list = (List<Scheme>)query.getResultList();
		
		if (list.isEmpty())
			return null;
		else
			return list.get(0);
	}

}
