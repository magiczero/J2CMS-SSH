package org.j2cms.model.schemetable2;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author HP
 * 二项分布试验方案表
 */
@Entity
@Table(name = "scheme_table")
public class SchemeTable2 implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7629914310443588562L;

	@Id
	@Column(name="record_id")
	@GeneratedValue
	private Integer id;	
	
	@Column(name="success_rate")
	private Double seccRate;					//可接收成功率
	
	@Column(name="differential_ratio")
	private Double diffRatio;					//鉴别比
	
	@Column
	private Double productor;
	
	@Column
	private Double uses;
	
	@Column(name="simple_size")
	private Double simpleSize;						//样本量
	
	@Column(name="judg_num")
	private String judgNum;							//判决数
	
	@Column
	private Double hwhat;
	
	@Column
	private Double swhat;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getSeccRate() {
		return seccRate;
	}

	public void setSeccRate(Double seccRate) {
		this.seccRate = seccRate;
	}

	public Double getDiffRatio() {
		return diffRatio;
	}

	public void setDiffRatio(Double diffRatio) {
		this.diffRatio = diffRatio;
	}

	public Double getProductor() {
		return productor;
	}

	public void setProductor(Double productor) {
		this.productor = productor;
	}

	public Double getUses() {
		return uses;
	}

	public void setUses(Double uses) {
		this.uses = uses;
	}

	public Double getSimpleSize() {
		return simpleSize;
	}

	public void setSimpleSize(Double simpleSize) {
		this.simpleSize = simpleSize;
	}

	public String getJudgNum() {
		return judgNum;
	}

	public void setJudgNum(String judgNum) {
		this.judgNum = judgNum;
	}

	public Double getHwhat() {
		return hwhat;
	}

	public void setHwhat(Double hwhat) {
		this.hwhat = hwhat;
	}

	public Double getSwhat() {
		return swhat;
	}

	public void setSwhat(Double swhat) {
		this.swhat = swhat;
	}
}
