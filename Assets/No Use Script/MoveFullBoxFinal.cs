using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveFullBoxFinal : MonoBehaviour
{
    public Transform VoidArea;
    public float speed = 5f; // Tốc độ di chuyển
    private bool isMoving = false; //Kiểm tra xem có đang di chuyển không

    public void MoveOut()
    {
        StartCoroutine(MoveToVoid());
    }
    private IEnumerator MoveToVoid()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, VoidArea.position) > 0.01f)
        {
            Vector3 direction = (VoidArea.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = VoidArea.position;

        isMoving = false;

        gameObject.SetActive(false);// Vô hiệu hóa BoxFull
    }
}