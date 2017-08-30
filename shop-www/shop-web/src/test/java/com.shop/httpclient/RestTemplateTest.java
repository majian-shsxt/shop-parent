

package com.shop.httpclient;

import com.shop.base.ResultInfo;
import org.junit.Test;
import org.springframework.web.client.RestTemplate;

/**
 * Created by TW on 2017/8/24.
 */
public class RestTemplateTest {

  /*   @Test
    public void testGet() {

       RestTemplate restTemplate=new RestTemplate();
        /*    String  result=restTemplate.getForObject("http://localhost:8082/keywords/get",
                     String.class);
      System.out.print(result);

        ResultInfo resultInfo = JSON.parseObject(result, ResultInfo.class);
        if (resultInfo.getResultCode() == 1) {
            List<String> stringList = (List<String>) resultInfo.getResult();
            System.out.println(stringList);*/

   /*   ResultInfo result = restTemplate.getForObject("http://localhost:8082/keywords/get",
                ResultInfo.class);
        List<String> keywords = (List<String>)result.getResult();
        System.out.println(keywords);

    }*/

    /* @Test
     public void testGetForEntity() {
         RestTemplate restTemplate = new RestTemplate();
         ResponseEntity<ResultInfo> result = restTemplate.getForEntity("http://localhost:8082/keywords/get",
                 ResultInfo.class);
         if (result.getStatusCode() == HttpStatus.OK) {
             ResultInfo resultInfo = result.getBody();
             System.out.println(resultInfo.getResult());
         } else {
             System.out.println(result.getStatusCodeValue());//错误信息
         }
     }
 */
    @Test
    public void testPost() {
        RestTemplate restTemplate = new RestTemplate();
        ResultInfo result = restTemplate.postForObject("http://localhost:8082/keywords/get",
                null, ResultInfo.class);
        System.out.println(result.getResult());
    }

}
