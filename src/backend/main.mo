import Time "mo:core/Time";
import List "mo:core/List";

actor {
  type Inquiry = {
    id : Nat;
    name : Text;
    email : Text;
    phone : Text;
    message : Text;
    timestamp : Time.Time;
  };

  var nextId = 0;
  let inquiries = List.empty<Inquiry>();

  public shared ({ caller }) func submitInquiry(name : Text, email : Text, phone : Text, message : Text) : async () {
    let inquiry : Inquiry = {
      id = nextId;
      name;
      email;
      phone;
      message;
      timestamp = Time.now();
    };
    inquiries.add(inquiry);
    nextId += 1;
  };

  public query ({ caller }) func getAllInquiries() : async [Inquiry] {
    inquiries.toArray();
  };
};
