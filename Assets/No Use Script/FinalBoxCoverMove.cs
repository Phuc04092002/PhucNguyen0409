using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FinalBoxCoverMove : MonoBehaviour
{
        public Transform targetBox;
        public float speed = 5f; // Tốc độ di chuyển
        private bool isMoving = false; //Kiểm tra xem có đang di chuyển không              
    public void Move()
    {
        StartCoroutine(MovetoBox());
    }
private IEnumerator MovetoBox()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, targetBox.position) > 0.01f)
        {
            Vector3 direction =  (targetBox.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = targetBox.position;

        isMoving = false;

        // Gọi hàm của FullBox
        GameObject FullBox = GameObject.FindWithTag("FullBox");
        MoveFullBoxFinal scriptFullBox = FullBox.GetComponent<MoveFullBoxFinal>();
        scriptFullBox.MoveOut();
    }
}