/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode* mergeTwoLists(ListNode* l1, ListNode* l2) {
        ListNode* tmp = new ListNode(0);
        ListNode* p = tmp;

        while (l1 != NULL && l2 != NULL){
            if (l1->val <= l2->val){
                p->next = l1;
                p = p->next;
                l1 = l1->next;
            } else {
                p->next = l2;
                p = p->next;
                l2 = l2->next;
            }
        }
        if (l1 == NULL){
            p->next = l2;
        } else {
            p->next = l1;
        }
        return tmp->next;
    }
}

//12 ms	8.8 MB