/***************************************************************************************
*    Title:         ItemReviewEntity.java
*    Purpose:       CAMPUS USERS CAN REVIEW ITEMS FROM SELLERS
*    Author:        TAN CHIN WEE
*    Credits:       CHEN MENG, NIGEL LEE TJON YI, TAN CHIN WEE, ZHU XINYI
*    Date:          31 JANUARY 2018
*    Code version:  1.0
*    Availability:  RESTRICTED
*
***************************************************************************************/
package unifyentities.marketplace;

import commoninfrastructureentities.UserEntity;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "ItemReview")
public class ItemReviewEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long itemReviewID;
    private String itemReviewRating;
    private String itemReviewContent;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date itemReviewDate;
    
    /* FOREIGN KEY */
    private String itemReceiverID;
    
    @ManyToOne
    private ItemEntity itemEntity;
    @ManyToOne
    private ItemOfferEntity itemOfferEntity;
    @ManyToOne
    private UserEntity userEntity;
    
    @PrePersist
    public void creationDate() { this.itemReviewDate = new Date(); }
    
    /* MISCELLANEOUS METHODS */
    public boolean createItemReview(String itemReviewRating, String itemReviewContent, String itemReceiverID) {
        this.itemReviewRating = itemReviewRating;
        this.itemReviewContent = itemReviewContent;
        this.itemReceiverID = itemReceiverID;
        return true;
    }
    
    /* GETTER METHODS */
    public Long getItemReviewID() { return itemReviewID; }
    public String getItemReviewRating() { return itemReviewRating; }
    public String getItemReviewContent() { return itemReviewContent; }
    public Date getItemReviewDate() { return itemReviewDate; }
    public String getItemReceiverID() { return itemReceiverID; }
    public ItemEntity getItemEntity() { return itemEntity; }
    public ItemOfferEntity getItemOfferEntity() { return itemOfferEntity; } 
    public UserEntity getUserEntity() { return userEntity; }
    
    /* SETTER METHODS */
    public void setItemReviewID(Long itemReviewID) { this.itemReviewID = itemReviewID; }
    public void setItemReviewRating(String itemReviewRating) { this.itemReviewRating = itemReviewRating; }
    public void setItemReviewContent(String itemReviewContent) { this.itemReviewContent = itemReviewContent; }
    public void setItemReviewDate(Date itemReviewDate) { this.itemReviewDate = itemReviewDate; }
    public void setItemReceiverID(String itemReceiverID) { this.itemReceiverID = itemReceiverID; }
    public void setItemEntity(ItemEntity itemEntity) { this.itemEntity = itemEntity; }
    public void setItemOfferEntity(ItemOfferEntity itemOfferEntity) { this.itemOfferEntity = itemOfferEntity; }
    public void setUserEntity(UserEntity userEntity) { this.userEntity = userEntity; }
}