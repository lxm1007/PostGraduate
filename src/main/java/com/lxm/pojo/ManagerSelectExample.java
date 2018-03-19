package com.lxm.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ManagerSelectExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ManagerSelectExample() {
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

        public Criteria andSelectIdIsNull() {
            addCriterion("SELECT_ID is null");
            return (Criteria) this;
        }

        public Criteria andSelectIdIsNotNull() {
            addCriterion("SELECT_ID is not null");
            return (Criteria) this;
        }

        public Criteria andSelectIdEqualTo(BigDecimal value) {
            addCriterion("SELECT_ID =", value, "selectId");
            return (Criteria) this;
        }

        public Criteria andSelectIdNotEqualTo(BigDecimal value) {
            addCriterion("SELECT_ID <>", value, "selectId");
            return (Criteria) this;
        }

        public Criteria andSelectIdGreaterThan(BigDecimal value) {
            addCriterion("SELECT_ID >", value, "selectId");
            return (Criteria) this;
        }

        public Criteria andSelectIdGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("SELECT_ID >=", value, "selectId");
            return (Criteria) this;
        }

        public Criteria andSelectIdLessThan(BigDecimal value) {
            addCriterion("SELECT_ID <", value, "selectId");
            return (Criteria) this;
        }

        public Criteria andSelectIdLessThanOrEqualTo(BigDecimal value) {
            addCriterion("SELECT_ID <=", value, "selectId");
            return (Criteria) this;
        }

        public Criteria andSelectIdIn(List<BigDecimal> values) {
            addCriterion("SELECT_ID in", values, "selectId");
            return (Criteria) this;
        }

        public Criteria andSelectIdNotIn(List<BigDecimal> values) {
            addCriterion("SELECT_ID not in", values, "selectId");
            return (Criteria) this;
        }

        public Criteria andSelectIdBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SELECT_ID between", value1, value2, "selectId");
            return (Criteria) this;
        }

        public Criteria andSelectIdNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SELECT_ID not between", value1, value2, "selectId");
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

        public Criteria andSelectTimeIsNull() {
            addCriterion("SELECT_TIME is null");
            return (Criteria) this;
        }

        public Criteria andSelectTimeIsNotNull() {
            addCriterion("SELECT_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andSelectTimeEqualTo(Date value) {
            addCriterion("SELECT_TIME =", value, "selectTime");
            return (Criteria) this;
        }

        public Criteria andSelectTimeNotEqualTo(Date value) {
            addCriterion("SELECT_TIME <>", value, "selectTime");
            return (Criteria) this;
        }

        public Criteria andSelectTimeGreaterThan(Date value) {
            addCriterion("SELECT_TIME >", value, "selectTime");
            return (Criteria) this;
        }

        public Criteria andSelectTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("SELECT_TIME >=", value, "selectTime");
            return (Criteria) this;
        }

        public Criteria andSelectTimeLessThan(Date value) {
            addCriterion("SELECT_TIME <", value, "selectTime");
            return (Criteria) this;
        }

        public Criteria andSelectTimeLessThanOrEqualTo(Date value) {
            addCriterion("SELECT_TIME <=", value, "selectTime");
            return (Criteria) this;
        }

        public Criteria andSelectTimeIn(List<Date> values) {
            addCriterion("SELECT_TIME in", values, "selectTime");
            return (Criteria) this;
        }

        public Criteria andSelectTimeNotIn(List<Date> values) {
            addCriterion("SELECT_TIME not in", values, "selectTime");
            return (Criteria) this;
        }

        public Criteria andSelectTimeBetween(Date value1, Date value2) {
            addCriterion("SELECT_TIME between", value1, value2, "selectTime");
            return (Criteria) this;
        }

        public Criteria andSelectTimeNotBetween(Date value1, Date value2) {
            addCriterion("SELECT_TIME not between", value1, value2, "selectTime");
            return (Criteria) this;
        }

        public Criteria andSelectTypeIsNull() {
            addCriterion("SELECT_TYPE is null");
            return (Criteria) this;
        }

        public Criteria andSelectTypeIsNotNull() {
            addCriterion("SELECT_TYPE is not null");
            return (Criteria) this;
        }

        public Criteria andSelectTypeEqualTo(String value) {
            addCriterion("SELECT_TYPE =", value, "selectType");
            return (Criteria) this;
        }

        public Criteria andSelectTypeNotEqualTo(String value) {
            addCriterion("SELECT_TYPE <>", value, "selectType");
            return (Criteria) this;
        }

        public Criteria andSelectTypeGreaterThan(String value) {
            addCriterion("SELECT_TYPE >", value, "selectType");
            return (Criteria) this;
        }

        public Criteria andSelectTypeGreaterThanOrEqualTo(String value) {
            addCriterion("SELECT_TYPE >=", value, "selectType");
            return (Criteria) this;
        }

        public Criteria andSelectTypeLessThan(String value) {
            addCriterion("SELECT_TYPE <", value, "selectType");
            return (Criteria) this;
        }

        public Criteria andSelectTypeLessThanOrEqualTo(String value) {
            addCriterion("SELECT_TYPE <=", value, "selectType");
            return (Criteria) this;
        }

        public Criteria andSelectTypeLike(String value) {
            addCriterion("SELECT_TYPE like", value, "selectType");
            return (Criteria) this;
        }

        public Criteria andSelectTypeNotLike(String value) {
            addCriterion("SELECT_TYPE not like", value, "selectType");
            return (Criteria) this;
        }

        public Criteria andSelectTypeIn(List<String> values) {
            addCriterion("SELECT_TYPE in", values, "selectType");
            return (Criteria) this;
        }

        public Criteria andSelectTypeNotIn(List<String> values) {
            addCriterion("SELECT_TYPE not in", values, "selectType");
            return (Criteria) this;
        }

        public Criteria andSelectTypeBetween(String value1, String value2) {
            addCriterion("SELECT_TYPE between", value1, value2, "selectType");
            return (Criteria) this;
        }

        public Criteria andSelectTypeNotBetween(String value1, String value2) {
            addCriterion("SELECT_TYPE not between", value1, value2, "selectType");
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