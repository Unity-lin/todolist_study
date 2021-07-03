package com.example.demo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateTypeTest {
    public static void main(String [] args){
        String dateType = "2021-05-01";
        String dateTimeType = "2021-05-01 13:22:36";

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        LocalDate date = LocalDate.parse(dateType, formatter);
        LocalDateTime date2 = LocalDateTime.parse(dateTimeType, formatter2);

        System.out.println(date);
        System.out.println(date2);

    }
}
