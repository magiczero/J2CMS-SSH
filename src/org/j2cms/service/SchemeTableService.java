package org.j2cms.service;

import java.util.List;

import org.j2cms.model.schemetable.SchemeTable;
import org.j2cms.service.base.DAO;

public interface SchemeTableService extends DAO<SchemeTable> {

	/**
	 * @param productor			生产方风险
	 * @param use						使用方风险
	 * @param diffratio				鉴别比
	 * @return
	 */
	public SchemeTable getScheme(double productor, double use, double diffratio);
	
	SchemeTable getSchemeByMinDingshi(double minNum);
	
	List<SchemeTable> schemeList(double productor, double use);
}
