package org.j2cms.model.testdata;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.j2cms.model.project.Project;

@Entity
@Table(name = "test_data")
public class TestData implements Serializable {

	private static final long serialVersionUID = -7465357496605765970L;
	
	@Id
	@Column(name="record_id")
	@GeneratedValue
	private Integer id;
	
	@Column(name="data_name", length=50, nullable=false)
	private String dataName;
	
	@ManyToOne(cascade = {CascadeType.MERGE,CascadeType.REFRESH }, optional = true)  
	@JoinColumn(name = "project_id")
	private Project project;
	
	@Column(name="fault_name", length=50, nullable=false)
	private String faultName;					//故障名称
	
	@Column(name="create_time")
	private Date createTime = new Date();
	
	@Column(name="fault_while")
	private String faultWhile;
	
	@Column(name="fault_phen")
	private String phenomenon;			//故障现象

	@Column(name="failure_cause")
	private String failureCause;				//故障原因

	@Column(name="solutions")
	private String solutions;					//解决措施
	
	@Column(name="fault_type")
	private int faultType;				//故障类型	1.AB 2.ANB 3.NAB 4.NANB 5.AC

	@Column(name="remark")
	private String remark;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getFaultName() {
		return faultName;
	}

	public void setFaultName(String faultName) {
		this.faultName = faultName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public String getFaultWhile() {
		return faultWhile;
	}

	public void setFaultWhile(String faultWhile) {
		this.faultWhile = faultWhile;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getPhenomenon() {
		return phenomenon;
	}

	public void setPhenomenon(String phenomenon) {
		this.phenomenon = phenomenon;
	}

	public String getFailureCause() {
		return failureCause;
	}

	public void setFailureCause(String failureCause) {
		this.failureCause = failureCause;
	}

	public String getSolutions() {
		return solutions;
	}

	public void setSolutions(String solutions) {
		this.solutions = solutions;
	}
	
	public int getFaultType() {
		return faultType;
	}

	public void setFaultType(int faultType) {
		this.faultType = faultType;
	}

}