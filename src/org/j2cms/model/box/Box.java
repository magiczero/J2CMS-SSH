package org.j2cms.model.box;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.j2cms.model.project.Project;

@Entity
@Table(name = "box")
public class Box implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3362485647224652081L;

	@Id
	@Column(name="record_id")
	@GeneratedValue
	private Integer id;
	
	@Column(name="name", unique = true, nullable=false, length=50)
	private String name;

	@Column(name="remark", nullable=true, length=200)
	private String remark;
	
	@OneToMany(cascade = { CascadeType.REFRESH, CascadeType.PERSIST,CascadeType.MERGE, CascadeType.REMOVE },mappedBy ="box")
	private Set<Project> projects = new HashSet<Project>();
	
	@Column(name="del_mark")
	private boolean delMark;

	public boolean isDelMark() {
		return delMark;
	}

	public void setDelMark(boolean delMark) {
		this.delMark = delMark;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}
}
