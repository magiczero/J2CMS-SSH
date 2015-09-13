package org.j2cms.model.assessment;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.j2cms.model.project.Project;

/**
 * @author HP
 * 可靠性评估
 */
@Entity
@Table(name = "assessment")
public class Assessment implements Serializable {

	private static final long serialVersionUID = 7545988097950855L;

	@Id
	@Column(name="record_id")
	@GeneratedValue
	private Integer id;
	
	@Column(name="name", length=50)
	private String name;
	
//	@OneToOne(optional = false, cascade = CascadeType.REFRESH)
//	@JoinColumn(name = "project_id", referencedColumnName = "record_id", unique = true)
//	private Project project;
	
	@ManyToOne(cascade = {CascadeType.MERGE,CascadeType.REFRESH }, optional = true)  
	@JoinColumn(name = "project_id")
	private Project project;
	
	@Column(name="sample_size")
	private String sampleSize;							//试验样本量
	
	@Column(name="total_time")
	private String totalTime;							//总试验时间
	
	@Column(name="fault_number")
	private Double faultNum;							//故障数/失效数
	
	@Column(name="points")
	private String point;								//评估值点估计
	
	@Column(name="section")
	private String fiducial;							//置信水平
	
//	@Column
//	private String productor;			//生成方风险
	
	@Column(name="fiducial_upper")
	private Integer fiducialUpper;						//置信上限				
	
	@Column(name="fiducial_lower")
	private Integer fiducialLower;						//置信下限
	
	@Column(name="remark", length=200)
	private String remark;
	
	
	public Integer getFiducialUpper() {
		return fiducialUpper;
	}

	public void setFiducialUpper(Integer fiducialUpper) {
		this.fiducialUpper = fiducialUpper;
	}

	public Integer getFiducialLower() {
		return fiducialLower;
	}

	public void setFiducialLower(Integer fiducialLower) {
		this.fiducialLower = fiducialLower;
	}

	public String getFiducial() {
		return fiducial;
	}

	public void setFiducial(String fiducial) {
		this.fiducial = fiducial;
	}


//	@Column(name="uses")
//	private String use;								//使用方风险
	
	
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

	public String getSampleSize() {
		return sampleSize;
	}

	public void setSampleSize(String sampleSize) {
		this.sampleSize = sampleSize;
	}

	public String getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}

	public Double getFaultNum() {
		return faultNum;
	}

	public void setFaultNum(Double faultNum) {
		this.faultNum = faultNum;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
