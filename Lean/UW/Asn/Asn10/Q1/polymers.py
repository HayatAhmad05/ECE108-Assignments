
def debug( msg ) :
  # print( "DEBUG: "+ msg )
  pass

def mk_perms( elems, indent=0 ) :
  if elems == [] :
    return [[]]
  else :
    pfx = "  "*indent
    debug( pfx + "1: begin elems="+ ",".join( elems ) )
    prev_elems = []
    res = []
    while elems != [] : 
      elem  = elems[0]
      elems = elems[1:]
      debug( pfx + f"2: prev="+ ",".join( prev_elems) +
             f"  elem={elem} elems="+ ",".join( elems ) )
      for perm in mk_perms( prev_elems + elems, indent=indent+1 ) :
        debug( pfx + "3: prev="+ ",".join( prev_elems ) +
               f"  elem={elem}  perm="+ ",".join( perm ) +
              f"  res=" + ",".join( [elem] + perm ) )
        res.append( [elem] + perm )
      prev_elems.append( elem )
    # debug( pfx + "-"*((7-indent)*10) )
    for perm in res :
      debug( pfx + "res=" + ",".join( perm ) )
    # debug( pfx + "-"*((7-indent)*5 ) )
    return res

# elems = ["A", "B", "C", "D", "E"]
elems = ["A", "B", "C"]

perms = mk_perms( ["A", "B", "C", "D", "E", "F", "G"] )


def adj( perm, el1, el2 ) :
  return abs( perm.index( el1 ) - perm.index(el2) ) == 1
  
def ab( perm ) :
  return adj( perm, "A", "B" )

def ab_or_ac( perm ) :
  return adj( perm, "A", "B" ) or adj( perm, "A", "C" )

def not__ab_or_ac( perm ) :
  return not ab_or_ac( perm )  

def ab_and_ac( perm ) :
  return adj(perm, "A", "B") and adj( perm, "A", "C" )  

def not_ab_and_not_ac( perm ) :
  return not(adj(perm, "A", "B")) and not(adj( perm, "A", "C" ))

def not_ab_or_not_ac( perm ) :
  return not(adj(perm, "A", "B")) or not(adj( perm, "A", "C" ))

def count( msg, pred, perms, do_print=False ) :
  perms =  list( filter( pred, perms ) )
  if do_print :
    for perm in perms :
      print(",".join( perm ) )
  n = len( perms )
  print( f"{msg:16s}" + f"= {n}" )
  
count( "total", (lambda x : True), perms )
count( "ab", ab, perms )
count( "ab_or_ac", ab_or_ac, perms )
count( "!(ab || ac)", not__ab_or_ac, perms )
count( "ab && ac", ab_and_ac, perms)
count( "(!ab) && (!ac)", not_ab_and_not_ac, perms)
count( "(!ab) || (!ac)", not_ab_or_not_ac, perms)
