public class RazorpayWrappers {
    
    /**
     * Create Customer
     */
    
    //Request
    public class RazorpayCreateCustomer{
        public String name {get; set;}
        public String email {get; set;}
        public String contact {get; set;}
        public String notes {get; set;}
    }
    //Response
    public class RazorpayCustomer{
		public String contact{get;set;}
		public String email{get;set;}
		public String gstin{get;set;}
		public String name{get;set;}
		public list<String> notes{get;set;}
		public String entity{get;set;}
		public Integer created_at{get;set;}
		public String id{get;set;}
        
    }
    
    //All Customer Records Response
    Public class Customers{
        List<RazorpayCustomer> items{get; set;}
        public Integer count{get;set;}
		public String entity{get;set;}
    }
}