package com.lxm.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class GroupInfoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public GroupInfoExample() {
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

        public Criteria andGroupIdIsNull() {
            addCriterion("GROUP_ID is null");
            return (Criteria) this;
        }

        public Criteria andGroupIdIsNotNull() {
            addCriterion("GROUP_ID is not null");
            return (Criteria) this;
        }

        public Criteria andGroupIdEqualTo(BigDecimal value) {
            addCriterion("GROUP_ID =", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdNotEqualTo(BigDecimal value) {
            addCriterion("GROUP_ID <>", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdGreaterThan(BigDecimal value) {
            addCriterion("GROUP_ID >", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("GROUP_ID >=", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdLessThan(BigDecimal value) {
            addCriterion("GROUP_ID <", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdLessThanOrEqualTo(BigDecimal value) {
            addCriterion("GROUP_ID <=", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdIn(List<BigDecimal> values) {
            addCriterion("GROUP_ID in", values, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdNotIn(List<BigDecimal> values) {
            addCriterion("GROUP_ID not in", values, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("GROUP_ID between", value1, value2, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("GROUP_ID not between", value1, value2, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupNumIsNull() {
            addCriterion("GROUP_NUM is null");
            return (Criteria) this;
        }

        public Criteria andGroupNumIsNotNull() {
            addCriterion("GROUP_NUM is not null");
            return (Criteria) this;
        }

        public Criteria andGroupNumEqualTo(String value) {
            addCriterion("GROUP_NUM =", value, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupNumNotEqualTo(String value) {
            addCriterion("GROUP_NUM <>", value, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupNumGreaterThan(String value) {
            addCriterion("GROUP_NUM >", value, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupNumGreaterThanOrEqualTo(String value) {
            addCriterion("GROUP_NUM >=", value, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupNumLessThan(String value) {
            addCriterion("GROUP_NUM <", value, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupNumLessThanOrEqualTo(String value) {
            addCriterion("GROUP_NUM <=", value, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupNumLike(String value) {
            addCriterion("GROUP_NUM like", value, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupNumNotLike(String value) {
            addCriterion("GROUP_NUM not like", value, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupNumIn(List<String> values) {
            addCriterion("GROUP_NUM in", values, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupNumNotIn(List<String> values) {
            addCriterion("GROUP_NUM not in", values, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupNumBetween(String value1, String value2) {
            addCriterion("GROUP_NUM between", value1, value2, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupNumNotBetween(String value1, String value2) {
            addCriterion("GROUP_NUM not between", value1, value2, "groupNum");
            return (Criteria) this;
        }

        public Criteria andGroupTimeIsNull() {
            addCriterion("GROUP_TIME is null");
            return (Criteria) this;
        }

        public Criteria andGroupTimeIsNotNull() {
            addCriterion("GROUP_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andGroupTimeEqualTo(String value) {
            addCriterion("GROUP_TIME =", value, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupTimeNotEqualTo(String value) {
            addCriterion("GROUP_TIME <>", value, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupTimeGreaterThan(String value) {
            addCriterion("GROUP_TIME >", value, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupTimeGreaterThanOrEqualTo(String value) {
            addCriterion("GROUP_TIME >=", value, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupTimeLessThan(String value) {
            addCriterion("GROUP_TIME <", value, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupTimeLessThanOrEqualTo(String value) {
            addCriterion("GROUP_TIME <=", value, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupTimeLike(String value) {
            addCriterion("GROUP_TIME like", value, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupTimeNotLike(String value) {
            addCriterion("GROUP_TIME not like", value, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupTimeIn(List<String> values) {
            addCriterion("GROUP_TIME in", values, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupTimeNotIn(List<String> values) {
            addCriterion("GROUP_TIME not in", values, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupTimeBetween(String value1, String value2) {
            addCriterion("GROUP_TIME between", value1, value2, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupTimeNotBetween(String value1, String value2) {
            addCriterion("GROUP_TIME not between", value1, value2, "groupTime");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceIsNull() {
            addCriterion("GROUP_PLACE is null");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceIsNotNull() {
            addCriterion("GROUP_PLACE is not null");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceEqualTo(String value) {
            addCriterion("GROUP_PLACE =", value, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceNotEqualTo(String value) {
            addCriterion("GROUP_PLACE <>", value, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceGreaterThan(String value) {
            addCriterion("GROUP_PLACE >", value, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceGreaterThanOrEqualTo(String value) {
            addCriterion("GROUP_PLACE >=", value, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceLessThan(String value) {
            addCriterion("GROUP_PLACE <", value, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceLessThanOrEqualTo(String value) {
            addCriterion("GROUP_PLACE <=", value, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceLike(String value) {
            addCriterion("GROUP_PLACE like", value, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceNotLike(String value) {
            addCriterion("GROUP_PLACE not like", value, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceIn(List<String> values) {
            addCriterion("GROUP_PLACE in", values, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceNotIn(List<String> values) {
            addCriterion("GROUP_PLACE not in", values, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceBetween(String value1, String value2) {
            addCriterion("GROUP_PLACE between", value1, value2, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupPlaceNotBetween(String value1, String value2) {
            addCriterion("GROUP_PLACE not between", value1, value2, "groupPlace");
            return (Criteria) this;
        }

        public Criteria andGroupTeaIsNull() {
            addCriterion("GROUP_TEA is null");
            return (Criteria) this;
        }

        public Criteria andGroupTeaIsNotNull() {
            addCriterion("GROUP_TEA is not null");
            return (Criteria) this;
        }

        public Criteria andGroupTeaEqualTo(String value) {
            addCriterion("GROUP_TEA =", value, "groupTea");
            return (Criteria) this;
        }

        public Criteria andGroupTeaNotEqualTo(String value) {
            addCriterion("GROUP_TEA <>", value, "groupTea");
            return (Criteria) this;
        }

        public Criteria andGroupTeaGreaterThan(String value) {
            addCriterion("GROUP_TEA >", value, "groupTea");
            return (Criteria) this;
        }

        public Criteria andGroupTeaGreaterThanOrEqualTo(String value) {
            addCriterion("GROUP_TEA >=", value, "groupTea");
            return (Criteria) this;
        }

        public Criteria andGroupTeaLessThan(String value) {
            addCriterion("GROUP_TEA <", value, "groupTea");
            return (Criteria) this;
        }

        public Criteria andGroupTeaLessThanOrEqualTo(String value) {
            addCriterion("GROUP_TEA <=", value, "groupTea");
            return (Criteria) this;
        }

        public Criteria andGroupTeaLike(String value) {
            addCriterion("GROUP_TEA like", value, "groupTea");
            return (Criteria) this;
        }

        public Criteria andGroupTeaNotLike(String value) {
            addCriterion("GROUP_TEA not like", value, "groupTea");
            return (Criteria) this;
        }

        public Criteria andGroupTeaIn(List<String> values) {
            addCriterion("GROUP_TEA in", values, "groupTea");
            return (Criteria) this;
        }

        public Criteria andGroupTeaNotIn(List<String> values) {
            addCriterion("GROUP_TEA not in", values, "groupTea");
            return (Criteria) this;
        }

        public Criteria andGroupTeaBetween(String value1, String value2) {
            addCriterion("GROUP_TEA between", value1, value2, "groupTea");
            return (Criteria) this;
        }

        public Criteria andGroupTeaNotBetween(String value1, String value2) {
            addCriterion("GROUP_TEA not between", value1, value2, "groupTea");
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