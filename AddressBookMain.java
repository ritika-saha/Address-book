public class AddressBookMain {

    public static void main(String[] args){
        System.out.println("----------------Welcome to Address Book Program--------------");

        //createContact branch to create contact

        //addContact branch to add
        contact c1=new contact("ritika", "saha", "fgrg", "fdrfg", "frgerg", "32423", "234324324", "dfbhsfd");
        AddressBook ab1=new AddressBook();
        ab1.addAddress(c1);
        
        
    }
}