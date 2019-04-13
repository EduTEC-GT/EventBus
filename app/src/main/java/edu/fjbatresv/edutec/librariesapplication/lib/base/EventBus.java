package edu.fjbatresv.edutec.librariesapplication.lib.base;

public interface EventBus {
    void register(Object sub);
    void unRegister(Object sub);
    void post(Object obj);
}
