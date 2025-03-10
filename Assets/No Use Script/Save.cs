using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
public class Save : MonoBehaviour
{
    public LayerMask ignoreLayers; // danh sách layer chỉ định
    public LayerMask layerMask; // Layer chỉ định cho ốc vít
    // Object lỗ vít trong ổ khóa
    public Transform targetObject;
    public Transform targetObject2;
    public Transform targetObject3;
    /// Lỗ vít tự do
    public Transform HoleArea;
    public Transform HoleArea2;
    public Transform HoleArea3;
    public Transform HoleArea4;
    public Transform HoleArea5;
    public float speed = 5f; // Tốc độ di chuyển
    private bool isMoving = false; //Kiểm tra xem có đang di chuyển không

    private void Update()
    {
        // Lấy vị trí các lỗ ổ khóa
        Vector2 checkPosition = targetObject.position;
        Vector2 checkPosition2 = targetObject2.position;
        Vector2 checkPosition3 = targetObject3.position;
        // Lấy vị trí các lỗ tự do
        Vector2 HoleAreaPosition = HoleArea.position;
        Vector2 HoleAreaPosition2 = HoleArea2.position;
        Vector2 HoleAreaPosition3 = HoleArea3.position;
        Vector2 HoleAreaPosition4 = HoleArea4.position;
        Vector2 HoleAreaPosition5 = HoleArea5.position;
        // Sự kiện khi nhấn chuột
        if (Input.GetMouseButtonDown(0))
        {
            // lấy mã màu hexadecimal của object
                    SpriteRenderer spriteRenderer = GetComponent<SpriteRenderer>();
                    string objectHexColor = ColorUtility.ToHtmlStringRGB(spriteRenderer.color);
                    GameObject objectC = GameObject.FindWithTag("Box");
                    SpriteRenderer targetSpriteRenderer = objectC.GetComponent<SpriteRenderer>();
                    string targetHexColor = ColorUtility.ToHtmlStringRGB(targetSpriteRenderer.color);
                    // Bỏ qua raycast các layer chỉ định
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit2D hit = Physics2D.Raycast(ray.origin, ray.direction, Mathf.Infinity, ~ignoreLayers);

            if (hit.collider != null)
            {
                if (hit.collider.gameObject == gameObject)
                {
                 if (objectHexColor.Equals(targetHexColor)) //Kiểm tra màu bằng Hexdecimal
                    {
                    // Di chuyển ốc vít và xét nếu lỗ vít đã có ốc
        Collider2D collider = Physics2D.OverlapPoint(checkPosition, layerMask); //Kiểm tra va chạm ở lỗ vít

        if (collider == null){

        StartCoroutine(MoveToTarget()); // Gọi coroutine di chuyển đến lỗ khóa
        }
        else {
            Collider2D collider2 = Physics2D.OverlapPoint(checkPosition2, layerMask);
            if (collider2 == null){
                StartCoroutine(MoveToTarget2());
            }
            else {
                Collider2D collider3 = Physics2D.OverlapPoint(checkPosition3, layerMask);
                if(collider3 == null){
                    StartCoroutine(MoveToTarget3());
                }
            }
        }
    }
        else{
        Collider2D collider = Physics2D.OverlapPoint(HoleAreaPosition, layerMask); //Kiểm tra va chạm ở lỗ vít

        if (collider == null){

        StartCoroutine(MoveToHole()); // Gọi coroutine di chuyển đến lỗ tự do
        }
        else {
            Collider2D collider2 = Physics2D.OverlapPoint(HoleAreaPosition2, layerMask);
            if (collider2 == null){
                StartCoroutine(MoveToHole2());
            }
            else {
                Collider2D collider3 = Physics2D.OverlapPoint(HoleAreaPosition3, layerMask);
                if(collider3 == null){
                    StartCoroutine(MoveToHole3());
                }
                else{
                    Collider2D collider4 = Physics2D.OverlapPoint(HoleAreaPosition4, layerMask);
            if (collider4 == null){
                StartCoroutine(MoveToHole4());
            }
            else {
                Collider2D collider5 = Physics2D.OverlapPoint(HoleAreaPosition5, layerMask);
                if(collider5 == null){
                    StartCoroutine(MoveToHole5());
                  }
               }
           }
       }
   }
}
        // Xóa bỏ joint giữa ốc vít và bảng kính
        HingeJoint2D hingeJoint = GetComponent<HingeJoint2D>();

        if (hingeJoint != null)
        {
            Rigidbody2D connectedBody = hingeJoint.connectedBody;

            if (connectedBody != null)
            {
                Destroy(hingeJoint);
                      }
                   }
                }
            }
        }
    }
    // Di chuyển liên tục đến lỗ 1
    private IEnumerator MoveToTarget()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, targetObject.position) > 0.01f)
        {
            Vector3 direction = (targetObject.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = targetObject.position;

        isMoving = false;
    }
    // Di chuyển liên tục đến lỗ 2
    private IEnumerator MoveToTarget2()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, targetObject2.position) > 0.01f)
        {
            Vector3 direction = (targetObject2.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = targetObject2.position;

        isMoving = false;
    }
    // Di chuyển liên tục đến lỗ 3
    private IEnumerator MoveToTarget3()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, targetObject3.position) > 0.01f)
        {
            Vector3 direction = (targetObject3.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = targetObject3.position;

        isMoving = false;
        // Gọi hàm của BoxCover
        GameObject BoxCover = GameObject.FindWithTag("BoxCover");
        BoxCoverMove scriptBoxCover = BoxCover.GetComponent<BoxCoverMove>();
        scriptBoxCover.Move();
    }
// Di chuyển đến các lỗ tự do
//1
private IEnumerator MoveToHole()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, HoleArea.position) > 0.01f)
        {
            Vector3 direction = (HoleArea.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = HoleArea.position;

        isMoving = false;
    }
//2
private IEnumerator MoveToHole2()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, HoleArea2.position) > 0.01f)
        {
            Vector3 direction = (HoleArea2.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = HoleArea2.position;

        isMoving = false;
    }
//3
private IEnumerator MoveToHole3()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, HoleArea3.position) > 0.01f)
        {
            Vector3 direction = (HoleArea3.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = HoleArea3.position;

        isMoving = false;
    }
//4
private IEnumerator MoveToHole4()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, HoleArea4.position) > 0.01f)
        {
            Vector3 direction = (HoleArea4.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = HoleArea4.position;

        isMoving = false;
    }
//5
private IEnumerator MoveToHole5()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, HoleArea5.position) > 0.01f)
        {
            Vector3 direction = (HoleArea5.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = HoleArea5.position;

        isMoving = false;
    }
}