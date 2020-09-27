/**
 * @author mateus-os 
 */
trigger Account on Account (after insert) {

    new AccountTH().run();

}