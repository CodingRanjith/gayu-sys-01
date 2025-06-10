/* 
@author    :  karthick.d  02/06/2025
@desc      :  build a where querystring from a collection of string
@param     :  {List<String> collection} -> should contains column names
@return    :  return string "column1=? AND column2=?"
 */
String queryBuilder(List<String> collection) {
  final qry = StringBuffer('');
  for (int i = 0; i < collection.length; i++) {
    qry
      ..write('${collection[i]}= ?')
      ..write(i < collection.length - 1 ? ' AND ' : '');
  }
  return qry.toString();
}
