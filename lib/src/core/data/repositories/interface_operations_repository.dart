abstract interface class IOperationsRepository<FuncType, ArgType> {
  Future<FuncType> addNew(ArgType model);
  Future<FuncType> edit(ArgType model);
  Future<FuncType> delete(ArgType model);
  Future<FuncType> deleteAll();
}
