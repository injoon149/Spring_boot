package jpabook.jpashop.repository;

import jpabook.jpashop.domain.orderStatus;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class OrderSearch {
    private String memberName;
    private orderStatus orderStatus;
}
