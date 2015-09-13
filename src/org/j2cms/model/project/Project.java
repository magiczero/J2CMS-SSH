package org.j2cms.model.project;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.j2cms.model.assessment.Assessment;
import org.j2cms.model.box.Box;
import org.j2cms.model.scheme.Scheme;
import org.j2cms.model.testdata.TestData;
import org.j2cms.model.user.User;

@Entity
@Table(name = "project")
public class Project implements Serializable {

	private static final long serialVersionUID = 4208122941233928289L;

	@Id
	@Column(name="record_id")
	@GeneratedValue
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "box_id")
	private Box box;

	@Column(name="project_name", unique = true, nullable=false, length=100)
	private String name;
	
//	@OneToOne(optional = true,cascade = CascadeType.ALL, mappedBy="project")
//	private Scheme scheme;
	
	@OneToMany(cascade = { CascadeType.REFRESH, CascadeType.PERSIST,CascadeType.MERGE, CascadeType.REMOVE },mappedBy ="project")
	private Set<Scheme> schemes = new HashSet<Scheme>();

	@OneToMany(cascade = { CascadeType.REFRESH, CascadeType.PERSIST,CascadeType.MERGE, CascadeType.REMOVE },mappedBy ="project")
	private Set<TestData> datas = new HashSet<TestData>();
	
//	@OneToOne(optional = true,cascade = CascadeType.ALL, mappedBy="project")
//	private Assessment assessment;
	
	@OneToMany(cascade = { CascadeType.REFRESH, CascadeType.PERSIST,CascadeType.MERGE, CascadeType.REMOVE },mappedBy ="project")
	private Set<Assessment> assessments = new HashSet<Assessment>();
	
	@Column(name="products_name", length=20)
	private String productName;
	
	@Column(name="reliability_index", length=50)
	private String reliaIndex;
	
	@Column(name="test_type")
	private boolean testType;
	
	@Column(name="test_scheme")
	private int testScheme;
	
	@Column(name="test_data", length=200)
	private String testData;
	
	@Column(name="review", length=200)
	private String review;
	
	@ManyToOne
	@JoinColumn(name = "creator")
	private User creator;
	
	@Column(name="create_while")
	private Date createTime = new Date();
	
	@Column(name="remark", length=100)
	private String remark;
	
	public Set<TestData> getDatas() {
		return datas;
	}

	public void setDatas(Set<TestData> datas) {
		this.datas = datas;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getReliaIndex() {
		return reliaIndex;
	}

	public void setReliaIndex(String reliaIndex) {
		this.reliaIndex = reliaIndex;
	}

	public boolean isTestType() {
		return testType;
	}

	public void setTestType(boolean testType) {
		this.testType = testType;
	}

	public int getTestScheme() {
		return testScheme;
	}

	public void setTestScheme(int testScheme) {
		this.testScheme = testScheme;
	}

	public String getTestData() {
		return testData;
	}

	public void setTestData(String testData) {
		this.testData = testData;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
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

	public Set<Scheme> getSchemes() {
		return schemes;
	}

	public void setSchemes(Set<Scheme> schemes) {
		this.schemes = schemes;
	}

	public Set<Assessment> getAssessments() {
		return assessments;
	}

	public void setAssessments(Set<Assessment> assessments) {
		this.assessments = assessments;
	}

	public Box getBox() {
		return box;
	}

	public void setBox(Box box) {
		this.box = box;
	}
}
