package com.lxm.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class StuSelectedExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StuSelectedExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andChooseIdIsNull() {
            addCriterion("CHOOSE_ID is null");
            return (Criteria) this;
        }

        public Criteria andChooseIdIsNotNull() {
            addCriterion("CHOOSE_ID is not null");
            return (Criteria) this;
        }

        public Criteria andChooseIdEqualTo(BigDecimal value) {
            addCriterion("CHOOSE_ID =", value, "chooseId");
            return (Criteria) this;
        }

        public Criteria andChooseIdNotEqualTo(BigDecimal value) {
            addCriterion("CHOOSE_ID <>", value, "chooseId");
            return (Criteria) this;
        }

        public Criteria andChooseIdGreaterThan(BigDecimal value) {
            addCriterion("CHOOSE_ID >", value, "chooseId");
            return (Criteria) this;
        }

        public Criteria andChooseIdGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("CHOOSE_ID >=", value, "chooseId");
            return (Criteria) this;
        }

        public Criteria andChooseIdLessThan(BigDecimal value) {
            addCriterion("CHOOSE_ID <", value, "chooseId");
            return (Criteria) this;
        }

        public Criteria andChooseIdLessThanOrEqualTo(BigDecimal value) {
            addCriterion("CHOOSE_ID <=", value, "chooseId");
            return (Criteria) this;
        }

        public Criteria andChooseIdIn(List<BigDecimal> values) {
            addCriterion("CHOOSE_ID in", values, "chooseId");
            return (Criteria) this;
        }

        public Criteria andChooseIdNotIn(List<BigDecimal> values) {
            addCriterion("CHOOSE_ID not in", values, "chooseId");
            return (Criteria) this;
        }

        public Criteria andChooseIdBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("CHOOSE_ID between", value1, value2, "chooseId");
            return (Criteria) this;
        }

        public Criteria andChooseIdNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("CHOOSE_ID not between", value1, value2, "chooseId");
            return (Criteria) this;
        }

        public Criteria andStuIdIsNull() {
            addCriterion("STU_ID is null");
            return (Criteria) this;
        }

        public Criteria andStuIdIsNotNull() {
            addCriterion("STU_ID is not null");
            return (Criteria) this;
        }

        public Criteria andStuIdEqualTo(BigDecimal value) {
            addCriterion("STU_ID =", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdNotEqualTo(BigDecimal value) {
            addCriterion("STU_ID <>", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdGreaterThan(BigDecimal value) {
            addCriterion("STU_ID >", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("STU_ID >=", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdLessThan(BigDecimal value) {
            addCriterion("STU_ID <", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdLessThanOrEqualTo(BigDecimal value) {
            addCriterion("STU_ID <=", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdIn(List<BigDecimal> values) {
            addCriterion("STU_ID in", values, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdNotIn(List<BigDecimal> values) {
            addCriterion("STU_ID not in", values, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("STU_ID between", value1, value2, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("STU_ID not between", value1, value2, "stuId");
            return (Criteria) this;
        }

        public Criteria andManagerIdIsNull() {
            addCriterion("MANAGER_ID is null");
            return (Criteria) this;
        }

        public Criteria andManagerIdIsNotNull() {
            addCriterion("MANAGER_ID is not null");
            return (Criteria) this;
        }

        public Criteria andManagerIdEqualTo(BigDecimal value) {
            addCriterion("MANAGER_ID =", value, "managerId");
            return (Criteria) this;
        }

        public Criteria andManagerIdNotEqualTo(BigDecimal value) {
            addCriterion("MANAGER_ID <>", value, "managerId");
            return (Criteria) this;
        }

        public Criteria andManagerIdGreaterThan(BigDecimal value) {
            addCriterion("MANAGER_ID >", value, "managerId");
            return (Criteria) this;
        }

        public Criteria andManagerIdGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("MANAGER_ID >=", value, "managerId");
            return (Criteria) this;
        }

        public Criteria andManagerIdLessThan(BigDecimal value) {
            addCriterion("MANAGER_ID <", value, "managerId");
            return (Criteria) this;
        }

        public Criteria andManagerIdLessThanOrEqualTo(BigDecimal value) {
            addCriterion("MANAGER_ID <=", value, "managerId");
            return (Criteria) this;
        }

        public Criteria andManagerIdIn(List<BigDecimal> values) {
            addCriterion("MANAGER_ID in", values, "managerId");
            return (Criteria) this;
        }

        public Criteria andManagerIdNotIn(List<BigDecimal> values) {
            addCriterion("MANAGER_ID not in", values, "managerId");
            return (Criteria) this;
        }

        public Criteria andManagerIdBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("MANAGER_ID between", value1, value2, "managerId");
            return (Criteria) this;
        }

        public Criteria andManagerIdNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("MANAGER_ID not between", value1, value2, "managerId");
            return (Criteria) this;
        }

        public Criteria andChooseDateIsNull() {
            addCriterion("CHOOSE_DATE is null");
            return (Criteria) this;
        }

        public Criteria andChooseDateIsNotNull() {
            addCriterion("CHOOSE_DATE is not null");
            return (Criteria) this;
        }

        public Criteria andChooseDateEqualTo(Date value) {
            addCriterion("CHOOSE_DATE =", value, "chooseDate");
            return (Criteria) this;
        }

        public Criteria andChooseDateNotEqualTo(Date value) {
            addCriterion("CHOOSE_DATE <>", value, "chooseDate");
            return (Criteria) this;
        }

        public Criteria andChooseDateGreaterThan(Date value) {
            addCriterion("CHOOSE_DATE >", value, "chooseDate");
            return (Criteria) this;
        }

        public Criteria andChooseDateGreaterThanOrEqualTo(Date value) {
            addCriterion("CHOOSE_DATE >=", value, "chooseDate");
            return (Criteria) this;
        }

        public Criteria andChooseDateLessThan(Date value) {
            addCriterion("CHOOSE_DATE <", value, "chooseDate");
            return (Criteria) this;
        }

        public Criteria andChooseDateLessThanOrEqualTo(Date value) {
            addCriterion("CHOOSE_DATE <=", value, "chooseDate");
            return (Criteria) this;
        }

        public Criteria andChooseDateIn(List<Date> values) {
            addCriterion("CHOOSE_DATE in", values, "chooseDate");
            return (Criteria) this;
        }

        public Criteria andChooseDateNotIn(List<Date> values) {
            addCriterion("CHOOSE_DATE not in", values, "chooseDate");
            return (Criteria) this;
        }

        public Criteria andChooseDateBetween(Date value1, Date value2) {
            addCriterion("CHOOSE_DATE between", value1, value2, "chooseDate");
            return (Criteria) this;
        }

        public Criteria andChooseDateNotBetween(Date value1, Date value2) {
            addCriterion("CHOOSE_DATE not between", value1, value2, "chooseDate");
            return (Criteria) this;
        }

        public Criteria andChooseTypeIsNull() {
            addCriterion("CHOOSE_TYPE is null");
            return (Criteria) this;
        }

        public Criteria andChooseTypeIsNotNull() {
            addCriterion("CHOOSE_TYPE is not null");
            return (Criteria) this;
        }

        public Criteria andChooseTypeEqualTo(String value) {
            addCriterion("CHOOSE_TYPE =", value, "chooseType");
            return (Criteria) this;
        }

        public Criteria andChooseTypeNotEqualTo(String value) {
            addCriterion("CHOOSE_TYPE <>", value, "chooseType");
            return (Criteria) this;
        }

        public Criteria andChooseTypeGreaterThan(String value) {
            addCriterion("CHOOSE_TYPE >", value, "chooseType");
            return (Criteria) this;
        }

        public Criteria andChooseTypeGreaterThanOrEqualTo(String value) {
            addCriterion("CHOOSE_TYPE >=", value, "chooseType");
            return (Criteria) this;
        }

        public Criteria andChooseTypeLessThan(String value) {
            addCriterion("CHOOSE_TYPE <", value, "chooseType");
            return (Criteria) this;
        }

        public Criteria andChooseTypeLessThanOrEqualTo(String value) {
            addCriterion("CHOOSE_TYPE <=", value, "chooseType");
            return (Criteria) this;
        }

        public Criteria andChooseTypeLike(String value) {
            addCriterion("CHOOSE_TYPE like", value, "chooseType");
            return (Criteria) this;
        }

        public Criteria andChooseTypeNotLike(String value) {
            addCriterion("CHOOSE_TYPE not like", value, "chooseType");
            return (Criteria) this;
        }

        public Criteria andChooseTypeIn(List<String> values) {
            addCriterion("CHOOSE_TYPE in", values, "chooseType");
            return (Criteria) this;
        }

        public Criteria andChooseTypeNotIn(List<String> values) {
            addCriterion("CHOOSE_TYPE not in", values, "chooseType");
            return (Criteria) this;
        }

        public Criteria andChooseTypeBetween(String value1, String value2) {
            addCriterion("CHOOSE_TYPE between", value1, value2, "chooseType");
            return (Criteria) this;
        }

        public Criteria andChooseTypeNotBetween(String value1, String value2) {
            addCriterion("CHOOSE_TYPE not between", value1, value2, "chooseType");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}