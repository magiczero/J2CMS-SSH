package org.j2cms.model.schemetable;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "scheme_table")
public class SchemeTable implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3635485944678632490L;

	@Id
	@Column(name="record_id")
	@GeneratedValue
	private Integer id;
	
	@Column(name="num", length=10, unique=true, nullable=false)
	private String schemeNum;
	
	@Column(name="productor_1")
	private Double productor1;						//生产方风险名义值
	
	@Column(name="use_1")
	private Double use1;									//使用方风险名义值
	
	@Column(name="productor_2")
	private Double productor2;						//生产方风险实际值
	
	@Column(name="productor_3")
	private Double productor3;
	
	@Column(name="mtbf")
	private Double mtbf;
	
	@Column(name="use_2")
	private Double use2;									//使用方风险实际值
	
	@Column(name="differential_ratio")
	private Double diffRatio;							//鉴别比
	
	@Column(name="test_time")
	private Double testTime;							//试验时间（检验下限的倍数）
	
	@Column(name="rejection")
	private Integer rejection;							//拒收数
	
	@Column(name="receive")
	private Integer receive;								//接受数
	
	@Column(name="type")
	private int type;											//方案表类型		1 标准定时试验方案表  2 短时高风险定时试验方案表
	
	@Column
	private String remark;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSchemeNum() {
		return schemeNum;
	}

	public void setSchemeNum(String schemeNum) {
		this.schemeNum = schemeNum;
	}

	public Double getProductor1() {
		return productor1;
	}

	public void setProductor1(Double productor1) {
		this.productor1 = productor1;
	}

	public Double getUse1() {
		return use1;
	}

	public void setUse1(Double use1) {
		this.use1 = use1;
	}

	public Double getProductor2() {
		return productor2;
	}

	public void setProductor2(Double productor2) {
		this.productor2 = productor2;
	}

	public Double getUse2() {
		return use2;
	}

	public void setUse2(Double use2) {
		this.use2 = use2;
	}

	public Double getDiffRatio() {
		return diffRatio;
	}

	public void setDiffRatio(Double diffRatio) {
		this.diffRatio = diffRatio;
	}

	public Double getTestTime() {
		return testTime;
	}

	public void setTestTime(Double testTime) {
		this.testTime = testTime;
	}

	public Integer getRejection() {
		return rejection;
	}

	public void setRejection(Integer rejection) {
		this.rejection = rejection;
	}

	public Integer getReceive() {
		return receive;
	}

	public void setReceive(Integer receive) {
		this.receive = receive;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Double getProductor3() {
		return productor3;
	}

	public void setProductor3(Double productor3) {
		this.productor3 = productor3;
	}

	public Double getMtbf() {
		return mtbf;
	}

	public void setMtbf(Double mtbf) {
		this.mtbf = mtbf;
	}
	
	
}
