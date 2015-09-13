package org.j2cms.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.j2cms.model.box.Box;
import org.j2cms.service.BoxService;
import org.j2cms.service.base.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class BoxServiceImpl extends DaoSupport<Box> implements BoxService {

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public List<Box> getAll() {
		// TODO Auto-generated method stub
		String entityname = getEntityName(this.entityClass);
		
		Query query = em.createQuery("select o from "+ entityname +" o where o.delMark = ?1");
		
		query.setParameter(1, true);
		
		return query.getResultList();
	}

}
