package org.j2cms.service;

import java.util.List;

import org.j2cms.model.box.Box;
import org.j2cms.service.base.DAO;

public interface BoxService extends DAO<Box> {

	List<Box> getAll();
}
