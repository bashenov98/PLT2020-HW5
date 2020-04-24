NatList = Rec X. <nil:Unit, cons:{Nat,X}>; 

nil = <nil=unit> as NatList;

cons = lambda n:Nat. lambda l:NatList. 
  <cons={n,l}> as NatList;

isnil = lambda l:NatList. 
  case l of
    <nil=u> ==> true
    | <cons=p> ==> false;

head = lambda l:NatList. 
  case l of
    <nil=u> ==> 0
    | <cons=p> ==> p.1;

tail = lambda l:NatList. 
  case l of
    <nil=u> ==> l
    | <cons=p> ==> p.2;

append = fix (
  lambda f:NatList->NatList->NatList.
    lambda l1:NatList. lambda l2:NatList.
      if isnil l1 then l2
      else cons (head l1) (f (tail l1) l2)
);

reverse = fix (
  lambda f:NatList->NatList.
    lambda l:NatList.
      if isnil l then nil 
      else append (f (tail l)) (cons  (head l)(nil))
);

mylist = cons 2 (cons 3 (cons 5 nil));

reverse mylist;