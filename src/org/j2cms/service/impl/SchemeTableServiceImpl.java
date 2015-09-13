package org.j2cms.service.impl;

import java.util.Collections;
import java.util.List;

import javax.persistence.Query;

import org.j2cms.model.schemetable.SchemeTable;
import org.j2cms.service.SchemeTableService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class SchemeTableServiceImpl extends DaoSupport<SchemeTable> implements
		SchemeTableService {


	@Override
	public SchemeTable getScheme(double productor, double use, double diffratio) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SchemeTable getSchemeByMinDingshi(double minNum) {
		// TODO Auto-generated method stub
		String entityname = getEntityName(this.entityClass);
		Query query = em.createQuery("select o from "+ entityname+ " o where o.testTime-(SELECT MIN(ABS(o.testTime - ?1)) FROM o WHERE o.type IN (1,2))=?2");
		query.setParameter(1, minNum);
		query.setParameter(2, minNum);
		
		return (SchemeTable)query.getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SchemeTable> schemeList(double productor, double use) {
		// TODO Auto-generated method stub
		String entityname = getEntityName(this.entityClass);
		Query query = em.createQuery("select o from "+ entityname+" o where o.productor1=?1 and o.use1=?2 and o.type in(1,2)");
		query.setParameter(1, productor);
		query.setParameter(2, use);
		List<SchemeTable> schemeList = query.getResultList();
		
		if(schemeList == null) return Collections.emptyList();
		return schemeList;
	}

}
