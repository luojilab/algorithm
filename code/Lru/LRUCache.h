#ifndef LRU_CHACHE_H
#define LRU_CHACHE_H
#include <unordered_map>
#include "DoubleLink.h"

namespace domain_algorithm_share {

	template<class Tk,	// key type
		class Tv	// mapped type
	>
	struct KeyValue
	{
		Tk key;
		Tv value;
	};

	template<class Tk,	// key type
		class Tv	// mapped type
	>
	class LRUCache
	{


	public:
		LRUCache(int capacity);

		~LRUCache();

		Tv Get(const Tk &key);

		void Put(const Tk &key, const Tv &val);


	private:

		int m_Capacity;
		DoubleLink<KeyValue<Tk, Tv> > m_Cache;
		std::unordered_map<Tk, DNode<KeyValue<Tk, Tv> > *>m_KeyToNode;
	};

	template<class Tk,	// key type
		class Tv	// mapped type
	>
	LRUCache<Tk, Tv>::LRUCache(int capacity) :m_Capacity(capacity), m_KeyToNode(capacity) {
	}

	template<class Tk,	// key type
		class Tv	// mapped type
	>
	LRUCache<Tk, Tv>::~LRUCache() {

	}

	template<class Tk,	// key type
		class Tv	// mapped type
	>
	Tv LRUCache<Tk, Tv>::Get(const Tk &key) {
		typename std::unordered_map<Tk, DNode<KeyValue<Tk, Tv> >* >::iterator iter = m_KeyToNode.find(key);
		if (iter == m_KeyToNode.end()) {//map中不存在key 直接返回-1
			//模版方法，对于非int类型，需要单独处理，为了适应例题，采用返回-1
			return -1;
		}

		Put(key, iter->second->value.value);// 利用 put 方法把该数据提前
		return iter->second->value.value;
	}

	template<class Tk,	// key type
		class Tv	// mapped type
	>
	void LRUCache<Tk, Tv>::Put(const Tk &key, const Tv &val) {
		KeyValue<Tk, Tv> keyValue;
		keyValue.key = key;
		keyValue.value = val;
		typename std::unordered_map<Tk, DNode<KeyValue<Tk, Tv> > *>::iterator iter = m_KeyToNode.find(key);
		if (iter != m_KeyToNode.end()) {//map中存在key
			m_Cache.delete_node(iter->second);//双向链表中删除 map中存的这个节点
			m_Cache.insert_first(keyValue);//双向链表把这个key的新值存储
			m_KeyToNode[key] = m_Cache.get_first();//map中更新这个key对应的新值
		}
		else {
			if (m_Capacity == m_Cache.size()) {//达到容量限制
				m_KeyToNode.erase(m_Cache.get_last()->value.key);//map中删除双相链表中表尾的值 对应的key
				m_Cache.delete_last();//同时双向链表删除表尾的值
			}
			m_Cache.insert_first(keyValue);//双向链表把新数据插入表头 
			m_KeyToNode[key] = m_Cache.get_first();//map对应值进行更新
		}
	}

}
#endif