package com.lxm.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class SyscodeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SyscodeExample() {
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

        public Criteria andSysIdIsNull() {
            addCriterion("SYS_ID is null");
            return (Criteria) this;
        }

        public Criteria andSysIdIsNotNull() {
            addCriterion("SYS_ID is not null");
            return (Criteria) this;
        }

        public Criteria andSysIdEqualTo(BigDecimal value) {
            addCriterion("SYS_ID =", value, "sysId");
            return (Criteria) this;
        }

        public Criteria andSysIdNotEqualTo(BigDecimal value) {
            addCriterion("SYS_ID <>", value, "sysId");
            return (Criteria) this;
        }

        public Criteria andSysIdGreaterThan(BigDecimal value) {
            addCriterion("SYS_ID >", value, "sysId");
            return (Criteria) this;
        }

        public Criteria andSysIdGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("SYS_ID >=", value, "sysId");
            return (Criteria) this;
        }

        public Criteria andSysIdLessThan(BigDecimal value) {
            addCriterion("SYS_ID <", value, "sysId");
            return (Criteria) this;
        }

        public Criteria andSysIdLessThanOrEqualTo(BigDecimal value) {
            addCriterion("SYS_ID <=", value, "sysId");
            return (Criteria) this;
        }

        public Criteria andSysIdIn(List<BigDecimal> values) {
            addCriterion("SYS_ID in", values, "sysId");
            return (Criteria) this;
        }

        public Criteria andSysIdNotIn(List<BigDecimal> values) {
            addCriterion("SYS_ID not in", values, "sysId");
            return (Criteria) this;
        }

        public Criteria andSysIdBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SYS_ID between", value1, value2, "sysId");
            return (Criteria) this;
        }

        public Criteria andSysIdNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SYS_ID not between", value1, value2, "sysId");
            return (Criteria) this;
        }

        public Criteria andFCodeIsNull() {
            addCriterion("F_CODE is null");
            return (Criteria) this;
        }

        public Criteria andFCodeIsNotNull() {
            addCriterion("F_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andFCodeEqualTo(String value) {
            addCriterion("F_CODE =", value, "fCode");
            return (Criteria) this;
        }

        public Criteria andFCodeNotEqualTo(String value) {
            addCriterion("F_CODE <>", value, "fCode");
            return (Criteria) this;
        }

        public Criteria andFCodeGreaterThan(String value) {
            addCriterion("F_CODE >", value, "fCode");
            return (Criteria) this;
        }

        public Criteria andFCodeGreaterThanOrEqualTo(String value) {
            addCriterion("F_CODE >=", value, "fCode");
            return (Criteria) this;
        }

        public Criteria andFCodeLessThan(String value) {
            addCriterion("F_CODE <", value, "fCode");
            return (Criteria) this;
        }

        public Criteria andFCodeLessThanOrEqualTo(String value) {
            addCriterion("F_CODE <=", value, "fCode");
            return (Criteria) this;
        }

        public Criteria andFCodeLike(String value) {
            addCriterion("F_CODE like", value, "fCode");
            return (Criteria) this;
        }

        public Criteria andFCodeNotLike(String value) {
            addCriterion("F_CODE not like", value, "fCode");
            return (Criteria) this;
        }

        public Criteria andFCodeIn(List<String> values) {
            addCriterion("F_CODE in", values, "fCode");
            return (Criteria) this;
        }

        public Criteria andFCodeNotIn(List<String> values) {
            addCriterion("F_CODE not in", values, "fCode");
            return (Criteria) this;
        }

        public Criteria andFCodeBetween(String value1, String value2) {
            addCriterion("F_CODE between", value1, value2, "fCode");
            return (Criteria) this;
        }

        public Criteria andFCodeNotBetween(String value1, String value2) {
            addCriterion("F_CODE not between", value1, value2, "fCode");
            return (Criteria) this;
        }

        public Criteria andFValueIsNull() {
            addCriterion("F_VALUE is null");
            return (Criteria) this;
        }

        public Criteria andFValueIsNotNull() {
            addCriterion("F_VALUE is not null");
            return (Criteria) this;
        }

        public Criteria andFValueEqualTo(String value) {
            addCriterion("F_VALUE =", value, "fValue");
            return (Criteria) this;
        }

        public Criteria andFValueNotEqualTo(String value) {
            addCriterion("F_VALUE <>", value, "fValue");
            return (Criteria) this;
        }

        public Criteria andFValueGreaterThan(String value) {
            addCriterion("F_VALUE >", value, "fValue");
            return (Criteria) this;
        }

        public Criteria andFValueGreaterThanOrEqualTo(String value) {
            addCriterion("F_VALUE >=", value, "fValue");
            return (Criteria) this;
        }

        public Criteria andFValueLessThan(String value) {
            addCriterion("F_VALUE <", value, "fValue");
            return (Criteria) this;
        }

        public Criteria andFValueLessThanOrEqualTo(String value) {
            addCriterion("F_VALUE <=", value, "fValue");
            return (Criteria) this;
        }

        public Criteria andFValueLike(String value) {
            addCriterion("F_VALUE like", value, "fValue");
            return (Criteria) this;
        }

        public Criteria andFValueNotLike(String value) {
            addCriterion("F_VALUE not like", value, "fValue");
            return (Criteria) this;
        }

        public Criteria andFValueIn(List<String> values) {
            addCriterion("F_VALUE in", values, "fValue");
            return (Criteria) this;
        }

        public Criteria andFValueNotIn(List<String> values) {
            addCriterion("F_VALUE not in", values, "fValue");
            return (Criteria) this;
        }

        public Criteria andFValueBetween(String value1, String value2) {
            addCriterion("F_VALUE between", value1, value2, "fValue");
            return (Criteria) this;
        }

        public Criteria andFValueNotBetween(String value1, String value2) {
            addCriterion("F_VALUE not between", value1, value2, "fValue");
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