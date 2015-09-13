package org.j2cms.model.scheme;

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

/**
 * @author HP
 *试验方案类
 */
@Entity
@Table(name = "test_scheme")
public class Scheme implements Serializable {

	private static final long serialVersionUID = -4298328579080424610L;

	@Id
	@Column(name="record_id")
	@GeneratedValue
	private Integer id;
	
//	@OneToOne(optional = false, cascade = CascadeType.REFRESH)
//	@JoinColumn(name = "project_id", referencedColumnName = "record_id", unique = true)
//	private Project project;
	
	@ManyToOne(cascade = {CascadeType.REFRESH }, optional = true)  
	@JoinColumn(name = "project_id")
	private Project project;
	
//	@Column(name="test_scheme")
//	private boolean testScheme; 			//试验方案
	
	@Column(name="scheme_name", length=50)
	private String schemeName;
	
	@Column(name="scheme_type")
	private Integer schemeType;					//方案类型     截尾方式
	
	@Column(name="types")
	private Integer type;						//新方案类型
	
	@Column(name="total_time")
	private Double totalTime;						//试验总时间
	
	@Column(name="unit")
	private Integer unit;								//时间单位

	@Column(name="sample_size")
	private Double sampleSize;					//样本量
	
	@Column(name="producer_risk")
	private Double producerRisk;					//生产方风险
	
	@Column(name="use_risk")
	private Double useRisk;							//使用方风险			
	
	@Column(name="discrimination_ratio")
	private Double ratio;									//鉴别比
	
	@Column(name="lower_limit")
	private Double lowerLimit;						//检验下限
	
	@Column(name="truncation_time")
	private Double truncTime;						//截尾时间数
	
	@Column(name="decision_fault")
	private Double decisionFault;					//判决故障数
	
	@Column(name="create_while")
	private Date createTime = new Date();			
	
	@Column(name="remark", length=100)
	private String remark;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getSchemeName() {
		return schemeName;
	}

	public void setSchemeName(String schemeName) {
		this.schemeName = schemeName;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Integer getSchemeType() {
		return schemeType;
	}

	public void setSchemeType(Integer schemeType) {
		this.schemeType = schemeType;
	}

	public Double getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(Double totalTime) {
		this.totalTime = totalTime;
	}

	public Double getSampleSize() {
		return sampleSize;
	}

	public void setSampleSize(Double sampleSize) {
		this.sampleSize = sampleSize;
	}

	public Double getProducerRisk() {
		return producerRisk;
	}

	public void setProducerRisk(Double producerRisk) {
		this.producerRisk = producerRisk;
	}

	public Double getUseRisk() {
		return useRisk;
	}

	public void setUseRisk(Double useRisk) {
		this.useRisk = useRisk;
	}

	public Double getRatio() {
		return ratio;
	}

	public void setRatio(Double ratio) {
		this.ratio = ratio;
	}

	public Double getLowerLimit() {
		return lowerLimit;
	}

	public void setLowerLimit(Double lowerLimit) {
		this.lowerLimit = lowerLimit;
	}

	public Double getTruncTime() {
		return truncTime;
	}

	public void setTruncTime(Double truncTime) {
		this.truncTime = truncTime;
	}

	public Double getDecisionFault() {
		return decisionFault;
	}

	public void setDecisionFault(Double decisionFault) {
		this.decisionFault = decisionFault;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getUnit() {
		return unit;
	}

	public void setUnit(Integer unit) {
		this.unit = unit;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}
